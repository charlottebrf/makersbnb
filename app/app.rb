ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './datamapper_setup'

# This is the controller for Makersbnb
class Makersbnb < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/home'
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/sign_in' do
    user = User.authenticate(params[:username], params[:password])
    session[:user_id] = user.id if user
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
    @requested_space = Space.get(session[:space_id])
    @user = current_user
    erb :'users/home'
  end

  get '/spaces/new' do
    erb :'spaces/new_space'
  end

  post '/spaces/new' do
    Space.create(name: params[:name],
                 owner: session[:user_id],
                 description: params[:description],
                 price: params[:price])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces_list'
  end

  post '/bookings/new' do
    session[:space_id] = params[:requested_space_id]
    redirect '/home'
  end

  run! if $PROGRAM_NAME == __FILE__
end
