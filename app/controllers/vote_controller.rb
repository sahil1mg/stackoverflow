class VoteController < ApplicationController
  before_action :initialize_vote_service, only: [:create, :destroy, :update]

  def create
    @vote_service.submit_vote
  end

  def get
    @vote_service.get_votes(vote_params[:vote][:votable_type], vote_params[:vote][:votable_type])
  end

  def destroy
    @vote_service.destroy_vote
  end

  def update
    @vote_service.update_vote
  end

  private

  def vote_params
    params.require(:vote).permit(:has_liked, :user_id, :votable_id, :votable_type)
  end

  def initialize_vote_service
    @vote_service = VoteService.new(vote_params[:vote])
  end
end
