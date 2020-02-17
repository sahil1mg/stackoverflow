class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_id, :is_admin, :deleted_at

  has_many :questions
  has_many :answers
  has_many :comments

end
