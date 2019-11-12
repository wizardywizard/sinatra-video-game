class VideoGamesController < ApplicationController

    get "/video_games" do
      redirect_if_not_logged_in
        @video_games = current_user.video_games.visible
        erb :"video_games/index"
    end

    get "/video_games/new" do
      redirect_if_not_logged_in
        @user = User.all
        erb :'/video_games/new'
    end

    post "/video_games" do
        redirect_if_not_logged_in
        @video_game = current_user.video_games.create(title: params[:title], system: params[:system], genre: params[:genre], complete: params[:complete], multiplayer: params[:multiplayer])
        @video_game.save
        redirect to "/video_games/#{@video_game.id}"
    end

    get '/video_games/:id/edit' do
      redirect_if_not_logged_in
        @video_game = VideoGame.find(params[:id])
        @User = User.all
        erb :'/video_games/edit'
      end
    
      get '/video_games/:id' do 
        redirect_if_not_logged_in
        @video_game = VideoGame.find(params[:id])    
        erb :'/video_games/show'
      end
    
      patch '/video_games/:id' do 
        redirect_if_not_logged_in
        @video_game = VideoGame.find_by_id(params[:id])
        redirect "/video_games/new" unless @video_game
        if @video_game.update(title: params[:title], system: params[:system], genre: params[:genre], complete: params[:complete], multiplayer: params[:multiplayer])
         redirect to "/video_games/#{@video_game.id}"
        else
          @error = "changes couldn't be saved because of the following errors: #{@video_game.error.full_messages.to_sentence}"
          erb :"video_games/edit"
        end
      end

      delete "/video_games/:id" do
        redirect_if_not_logged_in
        @video_game = VideoGame.find_by_id(params[:id])
        redirect "/video_games/new" unless @video_game
        @video_game.update(deleted: true)
        redirect "/video_games"
    end

end