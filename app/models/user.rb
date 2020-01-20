class User < ApplicationRecord
##############*Validation*################
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence:true
  validates :email_id, presence:true, format: { with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive:false}
  validates :password, presence:true, length: { minimum: 6 }
  validates :password_confirmation, presence:true, length: { minimum: 6 }
  has_secure_password
end
