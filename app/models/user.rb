class User < ActiveRecord::Base
   has_secure_password
   validates_presence_of :name, :email, :password
   validates_uniqueness_of :email
   has_many :video_games
end 