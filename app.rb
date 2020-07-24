require_relative './lib/rails_sanitizer'

class App < Sinatra::Base
  register Sinatra::R18n
  R18n.default_places { './locales' }
  R18n.set('en')

  configure do
    set :views, "views"
    set :public_dir, "public"
    set :static, true
    set :root, File.dirname(__FILE__)
    set :show_exceptions, false
  end

  error do |err|
    erb :not_found
  end

  get '/' do
    erb :index
  end
end
