require 'sinatra'
require "sinatra/reloader"
require './lib/birthday'


class Bday < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

get '/' do
  erb :index
end

post '/birthday' do
  @name = params[:name]
  @day = params[:day] + params[:birthday_month]
  @birthday = Birthday.new(@name, @day)
  erb :birthday
end


 # start the server if ruby file executed directly
 run! if app_file == $0
end