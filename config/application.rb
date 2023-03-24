require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module APP_NEW1
  class Application < Rails::Application
    config.load_defaults 6.0

    # ... d'autres configurations ...
    
    config.secret_key_base = ENV["694b40270b7187809ae27054531368b509b8ee1fe63830d2a4684258015803f09902cb7d5b22fc0ac1d8f52c03d3d8f332a59acd8b562d5586db64d60d3df72b"] # ajouter cette ligne ici

    # ... d'autres configurations ...
  end
end
