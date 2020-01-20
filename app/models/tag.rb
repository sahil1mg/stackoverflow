class Tag < ApplicationRecord
  ##############*Associations*##############
  has_and_belongs_to_many :questions
  ##############*Validation*################
  validates :label, presence:true
end
