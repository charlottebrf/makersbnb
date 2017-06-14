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
    erb :"users/signup"
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
<<<<<<< HEAD
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
=======
    User.create(name: params[:name], username: params[:username], email: params[:email])
    erb :"users/signup"
    redirect to '/home'
  end

  get '/home' do
    @user = User.first
    erb :"users/home"
>>>>>>> 51256f2c44ba8eb57ef88ebc3274004b9b3a1772
  end

  get '/spaces/new' do
    erb :"spaces/new_space"
  end

<<<<<<< HEAD
  post '/spaces/new' do
    Space.create(name: params[:new_space],
                 owner: session[:user_id])
    redirect '/spaces'
=======
  post "/spaces/new" do
    user = User.create(name: 'Sgt. Duck')
    user.spaces << Space.create(name: params[:name], description: params[:description], price: params[:price])
    user.save
    redirect "/spaces"
>>>>>>> 51256f2c44ba8eb57ef88ebc3274004b9b3a1772
  end

  get "/spaces" do
    @spaces = Space.all
    erb :"spaces/spaces_list"
  end

  run! if $PROGRAM_NAME == __FILE__
end
