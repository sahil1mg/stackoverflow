class Comment < ApplicationRecord
  ##############*Associations*##############
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  ##############*Validation*################
  validates :text, presence:true
  validates_inclusion_of  :commentable_type,
                          :in => %w( Question Answer )
end
