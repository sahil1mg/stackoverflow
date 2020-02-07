class TagSerializer < ActiveModel::Serializer
  attributes :id, :label, :body, :no_of_questions

  def no_of_questions
    object.questions.count
  end
end
