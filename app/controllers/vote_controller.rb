class VoteController < ApplicationController
  before_action :initialize_vote_service, only: [:create, :destroy, :update]
  skip_before_action :verify_authenticity_token

  def create
    @vote_service.submit_vote
    vote_hash = Vote.select(:has_liked).where(user_id:vote_params["user_id"], votable_id:vote_params["votable_id"], votable_type:vote_params["votable_type"]).group(:has_liked).count
    vote_count = 0
    vote_hash.each do |key, value| #vote_hash {true=>number, false=>number}
      if(key)
        vote_count+=value
      else
        vote_count-=value
      end
    end
    render json: vote_count
  end

  def vote_data
    votes = Vote.where(user_id:params[:user_id],  votable_id:params[:question_id], votable_type: 'Question').or(Vote.where(user_id:params[:user_id],  votable_id:Answer.where(question_id: params[:question_id]).ids, votable_type: 'Answer'))
    render json: votes
  end

  private

  def vote_params
    params.require("vote").permit("has_liked", "user_id", "votable_id", "votable_type")
  end

  def initialize_vote_service
    @vote_service = VoteService.new(vote_params)
  end
end
