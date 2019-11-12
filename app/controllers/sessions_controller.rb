class SessionsController < ApplicationController
 get '/login' do
    erb :'/sessions/login'
 end

 post '/login' do
    user = User.find_by_email(params[:email])
    if user
        if user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/'
        else
            erb :'/sessions/login'
        end
    else
        erb :'/registrations/signup'
        end
    end

 delete "/logout" do 
    session.clear
    redirect '/'
  end

end