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

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :following_relationships
 
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
 
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
  def self.search(search)
    if search
      User.where('name LIKE(?) or sex LIKE(?) ',  "%#{search}%","%#{search}%")
    else
      User.all
    end
  end
end

