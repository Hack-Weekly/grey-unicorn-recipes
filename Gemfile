source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.5"
gem "sprockets-rails"                  # Asset pipeline.
gem "pg", "~> 1.1"                     # Use PostgreSQL as the database.
gem "puma", "~> 5.0"                   # Use Puma as the app server.
gem "jsbundling-rails"                 # Bundle and transpile JavaScript.
gem "turbo-rails"                      # SPA-like functionality without having to write JS.
gem "stimulus-rails"                   # Hotwire"s modest JavaScript framework.
gem "cssbundling-rails"                # Bundle and process CSS.
gem "jbuilder"                         # Build JSON APIs with ease.
gem "redis", "~> 4.0"                  # Use Redis adapter to run Action Cable in production.
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootsnap", require: false         # Reduce boot times through caching.
gem "image_processing", "~> 1.2"       # Use Active Storage variants
gem "faraday"
gem "devise", "~> 4.9"
gem "petergate", "~> 3.0"
gem "inline_svg", "~> 1.8"
gem "mini_magick", "~> 4.11"
gem "omniauth-rails_csrf_protection"
gem "omniauth-github", "~> 2.0"
gem "omniauth-google-oauth2"
gem "carrierwave-aws", "~> 1.5"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem "pry-byebug"
end

group :development do
  gem "web-console"                     # Use console on exceptions pages
  gem "annotate"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
