require "sinatra/base"

class Makersbnb < Sinatra::Base
  enable :sessions

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
end
