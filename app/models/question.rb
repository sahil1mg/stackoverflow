class Question < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_and_belongs_to_many :tags
  ##############*Validation*################
  validates :title, presence:true

  default_scope -> { order(created_at: :desc) }
end
