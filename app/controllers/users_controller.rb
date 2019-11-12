class UsersController <  ApplicationController

    get "/users/home" do 
        @users = User.all
        erb :'users/home'
    end

    get "/users" do
        @users = User.all
        erb :'/users/index'
    end

    get "/users/new" do
        redirect_if_not_logged_in
        @video_games = VideoGame.visible
        erb :'/users/new'
    end

    post "/users" do
        redirect_if_not_logged_in
        @user = User.create(params[:user])
        if !params["title"]["name"].empty?
            @user.name << VideoGame.create(title: params["title"]["name"])
        end
        redirect "users/#{@user.id}"
    end

    get "/users/:id/edit" do
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        @video_games = VideoGame.visible
        erb :'/users/edit'
    end

    get "/users/:id" do 
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    patch "/users/:id" do 
        redirect_if_not_logged_in
        if !params[:user].keays.include?("video_game_ids")
            params[:user]["video_game_ids"] = []
        end
        @user = User.find(params[:id])
        @user.update(params["user"])
        if !params["video_game"]["title"].empty?
            @user.video_games << VideoGame.create(name: params["video_games"]["name"])
        end
        redirect "users/#{@user.id}"
    end
end