class Film < ApplicationRecord
  belongs_to :category

  has_one_attached :image
  
  validates :title, presence: true,
  validates :description, presence: true,
  validates :author, presence: true,
end
