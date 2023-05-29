class Product < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :orders

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, presence: true, length: { minimum: 8, maximum: 400 }
  validates :price, presence: true
  validates :user_id, :game_id, presence: true
end
