require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Goodbuy
  class Application < Rails::Application
    config.time_zone = 'Taipei'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = ["zh-TW", "en", "jp"]
    config.i18n.default_locale = "zh-TW"
    
  end
end
