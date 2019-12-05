require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add_bookmark' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
