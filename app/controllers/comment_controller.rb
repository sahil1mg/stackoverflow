class CommentController < ApplicationController
  before_action :initialize_comment_service, only: [:create, :update]
  skip_before_action :verify_authenticity_token

  #create
  def create
    comment = @comment_service.submit_comment
    render json: comment, status: :created
  end

  #show
  def show
    render json: @comment_service.get_comments
  end

  #edit
  def update
    comment = @comment_service.edit_text(params[:id])
    render json: comment, status: :ok
  end

  #destroy
  def destroy
    CommentService.destroy_comment(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text,:commentable_id,:commentable_type, :user_id)
  end

  def initialize_comment_service
    @comment_service = CommentService.new(comment_params)
  end
end
