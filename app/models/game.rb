class Game < ApplicationRecord
  has_many :products

  validates :title, presence: true, uniqueness: true
end
