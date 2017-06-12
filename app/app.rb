require "sinatra/base"

class Makersbnb < Sinatra::Base
  enable :sessions

  get "/signup" do
    erb :signup
  end

  get "/spaces/new" do
    erb :new_space
  end

  post "/spaces/new" do
    session[:new_space] = params[:new_space]
    redirect "/spaces"
  end

  get "/spaces" do
    erb :index
  end
end
