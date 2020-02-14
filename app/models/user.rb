class User < ApplicationRecord
##############*Validation*################
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  validates :name, presence:true
  validates :email_id, presence:true, format: { with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive:false, scope: :deleted_at}
  validates :password, presence:true, length: { minimum: 6 }, on: [:create, :update]
  validates :password_confirmation, presence:true, length: { minimum: 6 }, on: [:create, :update]
  scope :not_deleted, -> { where("deleted_at is null") }
##############*Associations*##############
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_many :tags, through: :questions

# Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
