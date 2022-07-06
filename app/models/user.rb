class User < ApplicationRecord
  has_many :categories
  has_many :films
  
  has_secure_password
  #mount_uploader :avatar, AvatarUploader
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
