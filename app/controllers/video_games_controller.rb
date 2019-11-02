class VideoGamesController < ApplicationController

    get "/video_games" do
        erb :'video_games/index'
    end

    get "/video_games/new" do
        erb :'/video_games/new'
    end

    post "/video_games" do
    end

    

end