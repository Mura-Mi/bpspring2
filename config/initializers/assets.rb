# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

Rails.application.config.assets.precompile += %w(base.css node_modules landing-page.scss bower_components)
Rails.application.config.assets.paths << Rails.root.join("bower_components")

Dir[Rails.root.join('app/assets/stylesheets/application-*.scss')].each do |f|
  Rails.application.config.assets.precompile += [File.basename(f).gsub(/scss$/, 'css')]
end
