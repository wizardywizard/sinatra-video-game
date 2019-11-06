class UsersController <  ApplicationController

    get "/users/home" do 
        @users = Users.all
        erb :'users/home'
    end

    get "/users" do
        @users = Users.all
        erb :'/users/index'
    end

    get "/users/new" do
        @video_games = VideoGames.all
        erb :'/users/new'
    end

    post "/users" do
        @user = User.create(params[:user])
        if !params["title"]["name"].empty?
            @user.name << VideoGames.create(title: params["title"]["name"])
        end
        redirect "users/#{@user.id}"
    end

    get "/users/:id/edit" do
        @user = User.find(params[:id])
        @video_games = VideoGames.all
        erb :'/users/edit'
    end

    get "/users/:id" do 
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    patch "/owners/:id" do 
        if !params[:user].keays.include?("video_game_ids")
            params[:user]["video_game_ids"] = []
        end
        @user = User.find(params[:id])
        @user.update(params["user"])
        if !params["video_game"]["title"].empty?
            @user.video_games << VideoGames.create(name: params["video_games"]["name"])
        end
        redirect "users/#{@user.id}"
    end

    get '/logout' do
        session.clear
    end

end