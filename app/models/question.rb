class Question < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  has_many :votes, as: :voted_object
  has_many :comments, as: :commented_on
  has_and_belongs_to_many :tags
  ##############*Validation*################
  validates :title, presence:true
end
