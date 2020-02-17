class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :votes, :updated_at, :user_name, :user_id, :deleted_at
  belongs_to :user
  has_many :tags
  has_many :comments
  has_many :answers


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
