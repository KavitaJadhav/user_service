require 'sidekiq'

Sidekiq.default_worker_options['retry'] = 1

Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 10 #default is 5 sec
end