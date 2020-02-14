class AnswerController < ApplicationController
  before_action :initialize_answer_service,only: [:create, :update]
  skip_before_action :verify_authenticity_token

  #create
  def create
    answer =@answer_service.submit_answer
    render json: answer, status: :created
  end

  #index
  def index
    render json: AnswerService.show_all
  end

  #edit
  def update
    answer = @answer_service.edit_text(params[:id])
    render json: answer, status: :ok
  end

  #destroy
  def destroy
    AnswerService.destroy_answer(params[:id])
  end

  #show
  def show
    answer = Answer.find(params[:id])
    render json: answer, include: 'user,question'
  end

  def show_by_question_id
    render json: Answer.includes(:comments, :votes, :user).where(question_id: params[:id]), include: 'comments'
  end

  def count
    render json: Answer.select(:question_id).where(question_id: params["ids"]).group(:question_id).count
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :user_id, :question_id)
  end

  def initialize_answer_service
    @answer_service = AnswerService.new(answer_params)
  end
end
