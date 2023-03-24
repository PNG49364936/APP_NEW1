require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module APP_new1
  class Application < Rails::Application
    config.load_defaults 6.0

    # ... d'autres configurations ...

    config.secret_key_base = ENV["714b38001c0632be187099c2accd3cfa7f2bad2494500065b5ce8b504930eb5657de6edb8bc1a7115d263275aa19398d325cf69659330aa2c902d86d93822e6a"] # ajouter cette ligne ici

    # ... d'autres configurations ...
  end
end
