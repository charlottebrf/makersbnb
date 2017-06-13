ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative './datamapper_setup'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/signup' do
    erb :signup
  end

  post '/users/new' do
    User.create(name: params[:name], username: params[:username], email: params[:email])
    erb :signup
    redirect to '/home'
  end

  get '/home' do
    @user = User.first
    erb :home
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    user = User.create(name: 'Sgt. Duck')
    user.spaces << Space.create(name: params[:new_space])
    user.save
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :index
  end

  run! if $PROGRAM_NAME == __FILE__
end
