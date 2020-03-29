class Tweet < ApplicationRecord
  # belongs_to :user
  # has_many :tweets
  validates :image,:text,:sex,:tall,:title,:temp, presence: true 
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  def self.search(search)
    if search
      Tweet.where('text LIKE(?) or title LIKE(?)  or sex LIKE(?)  or tall LIKE(?)  or temp LIKE(?) or typestyle LIKE(?)',"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%","%#{search}%")
    else
      Tweet.all
    end
  end
end
