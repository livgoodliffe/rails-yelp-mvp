class Restaurant < ApplicationRecord

  CATEGORIES = ['chinese', 'italian', 'japanese', 'french', 'belgian'].freeze

  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
