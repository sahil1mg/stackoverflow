class Vote < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  belongs_to :votable, polymorphic: true
  ##############*Validation*################
  validates_inclusion_of  :votable_type,
                          :in => %w( Question Answer )
end
