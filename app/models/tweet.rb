class Tweet < ApplicationRecord
  # belongs_to :user
  # has_many :tweets
  validates :image,:text, presence: true 
  mount_uploader :image, ImageUploader
  belongs_to :user
  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
