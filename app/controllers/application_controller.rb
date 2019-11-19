require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "game_on"
    set :views, 'app/views'
    set :sessions, true
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    redirect "/login" unless logged_in?
  end

  get "/" do
    erb :'/home'
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  get "/sessions/login" do    
    if logged_in?       
        redirect "/users/home"
    else 
    erb :'sessions/login'
    end
  end

  post "/registrations" do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id 
    redirect '/users/home'
  end  

  post "/sessions" do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id 
      redirect '/users/home'
    end
    redirect '/sessions/login'
  end 

  get "/users/home" do 
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end

end
