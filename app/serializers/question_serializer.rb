class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :votes, :updated_at, :no_of_answers, :user_name, :user_id
  belongs_to :user
  has_many :tags
  has_many :comments
  has_many :answers


  def votes
    object.votes.count
  end

  def no_of_answers
    object.answers.count
  end

  def user_name
    object.user.name
  end

  def user_id
    object.user.id
  end

end
