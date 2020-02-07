class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :user_name, :user_id
  belongs_to :user

  def user_name
    object.user.name
  end

  def user_id
    object.user.id
  end
end
