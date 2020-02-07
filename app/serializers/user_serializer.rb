class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_id

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :tags

end
