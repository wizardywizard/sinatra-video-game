class VideoGame < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :system, :genre
  def self.visible
    where(deleted: false)
  end
end 