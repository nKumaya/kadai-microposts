class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :favorites
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_many :favorites
  has_many :favoritelists, through: :favorites, source: :micropost
  has_many :reverses_of_favorites, class_name: 'Favorite', foreign_key: 'micropost_id'
  has_many :favorited, through: :reverses_of_favorites, source: :user

end
