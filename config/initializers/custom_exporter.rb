require 'prometheus/middleware/exporter'
require 'net/http'

module Prometheus
  module Middleware
    class CustomExporter < Prometheus::Middleware::Exporter
      def respond_with(format)
        byebug
        guage = @registry.metrics.first
        guage.set({name: :customerservice, env: Rails.env, description: customer_service_url}, customer_service_up?)

        super
      end

      private

      def customer_service_up?
        begin
          url = URI.parse(customer_service_url)
          req = Net::HTTP::Get.new(url.to_s)
          res = Net::HTTP.start(url.host, url.port) { |http|
            http.request(req)
          }
          return 1
        rescue
          return 0
        end
      end

      def customer_service_url
        'http://localhost:3001'
      end
    end
  end
end
