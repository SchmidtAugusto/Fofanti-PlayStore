class Game < ApplicationRecord
  has_many :products
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
end
