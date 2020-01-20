class Comment < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  belongs_to :commented_on, polymorphic: true
  ##############*Validation*################
  validates :statement, presence:true
  validates_inclusion_of  :commented_on_type,
                          :in => %w( Question Answer )
end
