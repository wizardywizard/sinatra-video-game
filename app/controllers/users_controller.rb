class UsersController < ApplicationController

    get "/users" do
        @users = Users.all
        erb :'/users/index'
    end

    get "/users/new" do
        @video = VideoGames.all
        erb :'/users/new'
    end

    post "/users" do
    end

    get "/users/:name/edit" do
        erb :'/users/edit'
    end

end