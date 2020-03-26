class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true #追記
  
         mount_uploader :image, ImageUploader
  
  # validates :profile, length: { maximum: 200 } #追記
  has_many :comments
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
  # def self.search(search)
  #   if search
  #     User.where('name LIKE(?) or profile LIKE(?)  or age LIKE(?)  or tall LIKE(?)',"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  #   else
  #     User.all
  #   end
  # end
end

