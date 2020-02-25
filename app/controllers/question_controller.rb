class QuestionController < ApplicationController
  before_action :initialize_question_service, only: [:update, :create]
  skip_before_action :verify_authenticity_token

  def index
    @questions = QuestionService.show_all
    respond_to do |format|
      format.json {render json: @questions, each_serializer: QuestionSerializer, include: 'tags'}
      format.html {render json: @questions}
    end
  end

  def show
    respond_to do |format|
      format.json {render json: QuestionService.get_question(params[:id]), serializer: QuestionSerializer, include: 'comments,tags'}
    end
  end

  #PATCH/PUT questions/1
  def update
    question = @question_service.update_question(params[:id])
    TagService::TagAdder.update_tags(question[:id], params["tags"])
    render json: question, status: :ok
  end

  def create
    puts "Started Create"
    question = @question_service.ask_question
    TagService::TagAdder.add_tags(question[:id], params["tags"])
    render json: question, status: :created
  end

  def destroy
    question = QuestionService.delete_question(params["id"])
    render json: question, status: :ok
  end

  def answered_questions
    questions=[]
    question_ids = []
    user= User.find(params[:id])
    if(user)
      user.answers.each do |answer|
        question_ids.push(answer.question_id)
      end
      questions = Question.includes(:tags, :votes, :user).where(id: question_ids)
      render json: questions, include: 'tags'
    else
      raise 'User not found'
    end
  end

  def search
    response = Question.not_deleted.includes(:tags, :user, :votes).where("title LIKE ? or body LIKE ? ", "%#{params[:search]}%", "%#{params[:search]}%")
    if(response.empty?)
      render status: :not_found
    else
      render json: response , each_serializer: QuestionSerializer, include: 'tags', status: :found
    end
  end

  def restore
    question = Question.find(params[:id])
    if(question)
      question.update_attribute(:deleted_at,nil)
      render json: question.to_json, status: :ok
    end
  end

  private

  def initialize_question_service
    puts "intializing question service"
    puts question_params
    @question_service = QuestionService.new(question_params)
    puts "completed initialization"
  end

  def question_params
    params.require("question").permit(:title,:body, :id, :user_id, :tags=>[])
  end
end
