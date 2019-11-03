class UsersController < ApplicationController

    get "/users" do
        @users = Users.all
        erb :'/users/index'
    end

    get "/users/new" do
        erb :'/users/new'
    end

    post "/users" do

    end

    get "/users/:name/edit" do
        erb :'/users/edit'
    end

    get '/logout' do
        session.clear
    end

end