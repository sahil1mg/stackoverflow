class Vote < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  belongs_to :voted_object, polymorphic: true
  ##############*Validation*################
  validates :voted_object_type, presence:true
  validates_inclusion_of  :voted_object_type,
                          :in => %w( Question Answer )
end
