source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


gem 'sinatra'
gem 'shotgun'
gem 'puma'
gem 'httparty'
gem 'sinatra-r18n'
gem 'json'
# Sanitizer
gem 'rails-html-sanitizer'

group :development, :test do
  gem 'pry'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
