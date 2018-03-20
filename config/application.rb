require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UserService
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.use ExceptionNotification::Rack,
                          email: {
                            email_prefix: Rails.env,
                            sender_address: '"Exception Notifier" <jadhavkavita206@gamil.com>',
                            exception_recipients: ["kavitama@thoughtworks.com"]
                            },

                          slack: {
                            webhook_url: "https://hooks.slack.com/services/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",
                            channel: "#exception",
                            additional_parameters: { mrkdwn: true }
                          }
  end
end
