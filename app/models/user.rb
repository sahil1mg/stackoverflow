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
    digest = self.send("#{attribute}")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember, nil)
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember_token
    remember_token = User.new_token
    update_attribute(:remember, User.digest(remember_token))
    return remember_token
  end

  private

  # Returns a random token.
    def self.new_token
      SecureRandom.urlsafe_base64
    end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
