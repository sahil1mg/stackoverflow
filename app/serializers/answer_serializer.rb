class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_name, :user_id, :votes, :deleted_at
  belongs_to :user
  belongs_to :question
  has_many :comments

  def votes
    votes_count = 0
    object.votes.each do |vote|
      if(vote[:has_liked])
        votes_count+=1
      else
        votes_count-=1
      end
    end
    return votes_count
  end

  def user_name
    object.user.name
  end

  def user_id
    object.user.id
  end
end
