ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative './datamapper_setup'

class Makersbnb < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/sign_in' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
    end
    redirect '/home'
  end

  post '/sign_out' do
    session[:user_id] = nil
    redirect '/home'
  end

  post '/users/new' do
    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/home' do
    @user = current_user
    erb :home
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    Space.create(name: params[:new_space],
                 owner: session[:user_id])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :index
  end

  run! if $PROGRAM_NAME == __FILE__
end
