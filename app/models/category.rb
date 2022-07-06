class Category < ApplicationRecord
  has_many :films

  validates :name, presence: true
end
