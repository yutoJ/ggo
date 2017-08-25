source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.4'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

#ui
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'sass-rails', '~> 5.0'
gem 'font-awesome-sass'
gem 'jquery-ui-rails', '~> 5.0'

#functions
gem 'devise', '~> 4.2'
gem 'toastr-rails', '~> 1.0'
gem 'paperclip', '~> 5.1.0'
gem 'geocoder', '~> 1.4'
gem 'ransack', '~> 1.7'
gem 'twilio-ruby', '~> 4.11.1'
gem 'fullcalendar-rails', '~> 3.4.0'
gem 'momentjs-rails', '~>2.17.1'

#test
gem 'faker'

#debug
gem 'pry-rails'
gem 'better_errors'
gem 'rails_12factor', group: :production

#auth
gem 'omniauth', '~> 1.6'
gem 'omniauth-facebook', '~> 4.0'
gem 'omniauth-twitter'
#storage
gem 'aws-sdk', '~> 2.8'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

#non-function
gem 'dotenv-rails'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
  gem 'faker'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
