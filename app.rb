class App < Sinatra::Base
  register Sinatra::R18n
  R18n.default_places { './locales' }
  R18n.set('en')
  enable :sessions

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

  error Sinatra::NotFound do
    erb :not_found
  end

  get '/' do
    clear_widget_code
    erb :index
  end

  get '/widget_form' do
    clear_widget_code
    @type = params['type'] || 'realtime'
    erb :widget_form
  end

  post '/widget' do
    save_content('widget_code', params['content'])
    redirect '/watch_broadcast'
  end

  get '/watch_broadcast' do
    @content = page_content('widget_code')
    erb :watch_broadcast
  end

  private

  def page_content(title)
    File.read("pages/#{title}.txt")
  rescue Errno::ENOENT
    return nil
  end

  def save_content(title, content)
    File.open("pages/#{title}.txt", "w") do |file|
      file.print(content)
    end
  end

  def clear_widget_code
    save_content('widget_code', '')
  end
end
