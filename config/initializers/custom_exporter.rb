require 'prometheus/middleware/exporter'

module Prometheus
  module Middleware
    class CustomExporter < Prometheus::Middleware::Exporter
      def respond_with(format)
        super
      end
    end
  end
end
