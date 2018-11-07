class Message < ApplicationRecord
  has_many :likes
  has_many :dislikes

  belongs_to :user

  validates :content, presence: true
end