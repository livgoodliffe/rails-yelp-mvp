class Review < ApplicationRecord
  STARS = [0, 1, 2, 3, 4, 5].freeze
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: STARS }
end
