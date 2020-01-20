class Answer < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voted_object
  has_many :comments, as: :commented_on
  ##############*Validation*################
  validates :statement, presence:true
end
