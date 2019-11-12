class AddDeletedToVideoGames < ActiveRecord::Migration
    def change
        add_column :video_games, :deleted, :boolean, default: false
    end
end