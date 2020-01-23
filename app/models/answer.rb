class Answer < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  ##############*Validation*################
  validates :text, presence:true
end
