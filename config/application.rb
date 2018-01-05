require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookAdmin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # # アセットパスの追加
    # $PROJECT_HOME/bin/rake assets:precompile でプリコンパイル

    # # autoloadの対象設定
    # config.autoload_paths += %W(#{config.root}/lib/autoload)

    config.assets.path << Rails.root.join("components")
  end
end
