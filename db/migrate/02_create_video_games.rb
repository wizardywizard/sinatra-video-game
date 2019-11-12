class CreateVideoGames < ActiveRecord::Migration
    def change
      create_table :video_games do |t|
        t.string :title
        t.string :system
        t.string :genre
        t.boolean :complete
        t.boolean :multiplayer
      end  
    end
  end