require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    config.react.variant      = :production
    config.react.addons       = true
    config.active_record.raise_in_transactional_callbacks = true
    config.browserify_rails.commandline_options = "--transform reactify --extension=\".jsx\""
  end
end
