source 'https://rubygems.org'
ruby '2.2.2'

# Framework and Server
gem 'rails', '4.2.3'
gem 'puma'

# Markup and styling
gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'font-awesome-sass'

# Javascript
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'react-rails', '~> 1.3.0'

# Authentication and security
gem 'devise'
gem 'figaro', '1.0'

# Miscelaneous
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Development and test database
  gem 'sqlite3'

  # Testing
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers', '~>3.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'

  # Debugging
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  # Production database
  gem 'pg'
  gem 'rails_12factor'
end
