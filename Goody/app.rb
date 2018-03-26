# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/jsonp'

set :database, 'sqlite3:test-app.sqlite3'

require './resource/user_data'
require './resource/like_status'

# app.rb
get '/user_data' do
  @data = UserData.new.user_all
  # @data
end

get '/like_status' do
  @article = LikeStatus.new.get_all_article
  # @data
end

post '/like_status' do
  @article = LikeStatus.new.search
  # @data
end