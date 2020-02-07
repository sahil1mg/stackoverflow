class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_name, :user_id, :comments
  belongs_to :user
  belongs_to :question
  has_many :comments

  def user_name
    object.user.name
  end

  def user_id
    object.user.id
  end
end
