require 'sidekiq'

Sidekiq.default_worker_options['retry'] = 1

Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 10 #default is 5 sec

  schedule_file = "config/schedule.yml"
  if File.exists?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq::Extensions.enable_delay!
# enable_delay! = Default is set to false.
# It can allow delayed/asynchronous method execution. user delay, delay_for, delay_until methods.
# Should avoid passing activerecord object as they may contain stale data at time of execution. Pass object id instead.
# It can be used with activerecord class as well. Eg. User.delay_for(2.weeks).say_hello