class Film < ApplicationRecord
  belongs_to :category
  belongs_to :user

   has_one_attached :image
  
   validates :title, presence: true, uniqueness: { case_sensitive: false }
   validates :description, presence: true
   validates :author, presence: true
 
   scope :search, ->(title) { where('LOWER(title) LIKE ?', "%#{title.downcase}%") if title.present? }
   scope :sorted_by_title, -> { order(:title) }
end
