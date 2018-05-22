require 'prometheus/client'

module Prometheus
  module Controller
    prometheus = Prometheus::Client.registry
    gauge = Prometheus::Client::Gauge.new(:online_store, 'Health check for user service')

    prometheus.register(gauge)
  end
end
