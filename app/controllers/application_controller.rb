require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "game_on"
    set :views, 'app/views'
    set :sessions, true
  end

  get "/" do
    erb :'/home'
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post "/registrations" do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id 
    redirect '/users/home'
  end

  get "/sessions/login" do
    @user = User.find_by(email: params[:email])
    if @user 
      @user.authenticate(params[:password])
        redirect "/user/home"
    else 
    erb :'sessions/login'
  end

  post "/sessions" do
    @user = User.find_by(email: params[:email], password:[:password])
    if @user 
      session[:user_id] = @user.id 
      redirect '/users/home'
    end
    redirect '/sessions/login'
  end

  get "/sessions/logout" do 
    session.clear
    redirect '/'
  end

  get "/users/home" do 
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end
end
