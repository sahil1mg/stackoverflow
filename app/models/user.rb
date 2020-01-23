class User < ApplicationRecord
##############*Validation*################
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  validates :name, presence:true
  validates :email_id, presence:true, format: { with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive:false}
  validates :password, presence:true, length: { minimum: 6 }, on: [:create, :update]
  validates :password_confirmation, presence:true, length: { minimum: 6 }, on: [:create, :update]

##############*Associations*##############
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
end
