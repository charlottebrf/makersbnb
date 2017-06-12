require "sinatra/base"

class Makersbnb < Sinatra::Base
  enable :sessions

  get "/signup" do
    erb :signup
  end

  post "/users/new" do
    erb :signup
    redirect to "/home"
  end

  get "/home" do
    erb :home
  end

  get "/spaces/new" do
    erb :new_space
  end

  post "/spaces/new" do
    session[:new_space] = params[:new_space]
    redirect "/spaces"
  end

  get "/spaces" do
    @new_space = session[:new_space]
    erb :index
  end

  run! if app_file == $0
end
