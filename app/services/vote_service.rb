class VoteService

  def initialize(vote_params)
    @vote_params = vote_params
  end

  def submit_vote
    params={:votable_type=>@vote_params["votable_type"], :votable_id=>@vote_params["votable_id"], :user_id=>@vote_params["user_id"]}
    vote = Vote.find_or_initialize_by(params)
    if(vote[:id] && vote[:has_liked].to_s==@vote_params["has_liked"])
      vote.destroy!
    else
      vote[:has_liked]= @vote_params["has_liked"]
      vote.save!
    end
  end
end