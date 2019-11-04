class VideoGamesController < ApplicationController

    get "/video_games" do
        @video_games = VideoGames.all
        erb :'video_games/index'
    end

    get "/video_games/new" do
        @user = Users.all
        erb :'/video_games/new'
    end

    post "/video_games" do
        @video_games = VideoGames.create(params[:video_game])
        if !params[:user][:name].empty?
            @video_games.user = User.create(name: params[:user][:name])
        else
            @video_games.user = User.find_by_id(params[:Video_game][:user_id])
        end
        @video_game.save
        redirect to "videogames/#{video_game.id}"
    end

    get '/video_games/:id/edit' do
        @video_game = ViderGames.find_by_id(params[:id])
        @User = Users.all
        erb :'/video_games/edit'
      end
    
      get '/video_games/:id' do 
        @video_game = VideoGamess.find(params[:id])
        erb :'/video_games/show'
      end
    
      patch '/video_games/:id' do 
    
        redirect to "video_games/#{@video_game.id}"
      end

end