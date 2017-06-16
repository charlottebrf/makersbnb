ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative './datamapper_setup'

# This is the controller for Makersbnb
class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  before do
    current_user
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
    session.clear
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
    if Booking.all && Space.all && current_user
      @requested_spaces = Array.new
      bookings = Booking.all(user_id: @current_user.id)
      bookings.each do |booking|
        @requested_spaces << Space.first(id: booking.space_id)
      end
    end
    @requested_date  = session[:date]
    @user = current_user
    @bookings_pending_approval = @user.gather_info_for_bookings if @user
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
    Booking.create(user_id: @current_user.id,
                   space_id: params[:requested_space_id])
    if params[:date] != ''
      session[:date] = params[:date]
      redirect '/home'
    else
      @user = current_user
      flash.now[:notice] = 'You must select a date to make a booking'
      @spaces = Space.all
      erb :'spaces/spaces_list'
    end
  end

  post '/request/approve/:booking_id' do
    booking = Booking.get(params[:booking_id])
    booking.status = 'approved'
    p booking.save
  end

  post '/request/deny/:booking_id' do
    booking = Booking.get(params[:booking_id])
    booking.status = 'denied'
    p booking.save
  end

  run! if $PROGRAM_NAME == __FILE__
end
