class VoteService

  def initialize(vote_params)
    @vote_params = vote_params
  end

  def submit_vote
    vote = Vote.new(@vote_params)
    vote.save!
  end

  def get_votes(votable_type, votable_id)
    Vote.where(votable_type: votable_type, votable_id: votable_id)
  end

  def get_vote(votable_type, votable_id, user_id)
    Vote.where(votable_type: votable_type, votable_id: votable_id, user_id: user_id)
  end

  def destroy_vote
    vote = self.get_vote(@vote_params[:votable_type], @vote_params[:votable_id], @vote_params[:user_id])
    vote.destroy!
  end

  def update_vote
    vote = self.get_vote(@vote_params[:votable_type], @vote_params[:votable_id], @vote_params[:user_id])
    vote.has_liked = @vote_params[:has_liked]
    vote.save!
  end

end