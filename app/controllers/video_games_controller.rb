class VideoGamesController < ApplicationController

    get "/video_games" do
        @video_games = VideoGame.all
        erb :"video_games/index"
    end

    get "/video_games/new" do
      redirect_if_not_logged_in
        @user = User.all
        erb :'/video_games/new'
    end

    post "/video_games" do
        redirect_if_not_logged_in
        @video_game = VideoGame.create(title: params[:title], system: params[:system], genre: params[:genre], complete?: params[:complete?], multiplayer?: params[:multiplayer?])
        redirect to "/video_games/#{@video_game.id}"
    end

    get '/video_games/:id/edit' do
      redirect_if_not_logged_in
        @video_game = ViderGame.find_by_id(params[:id])
        @User = User.all
        erb :'/video_games/edit'
      end
    
      get '/video_games/:id' do 
        @video_game = VideoGame.find(params[:id])
        erb :'/video_games/show'
      end
    
      patch '/video_games/:id' do 
        redirect_if_not_logged_in
    
        redirect to "video_games/#{@video_game.id}"
      end

end