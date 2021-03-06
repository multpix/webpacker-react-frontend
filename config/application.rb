require_relative 'boot'

require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WebpackerReactFrontend
  class Application < Rails::Application
    if defined? Rack::Cors
      Rails.configuration.middleware.insert_before 0, Rack::Cors do
        allow do
          origins %w[
            https://webpacker-example-app.herokuapp.com
          ]
          resource '/bundles/*'
        end
      end
    end
  end
end
