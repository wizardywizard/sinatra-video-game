class AddUserIdToVideoGames < ActiveRecord::Migration
    def change
        add_column(:video_games, :user_id, :integer, foreign_key: true)
    end
end