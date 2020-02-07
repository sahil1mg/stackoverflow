class QuestionController < ApplicationController
  before_action :initialize_question_service, only: [:update, :create]
  skip_before_action :verify_authenticity_token

  def index
    @questions = QuestionService.show_all
        #Question.all.includes(:user, :tags)
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
    render json: question, status: :ok
  end

  def create
    puts "Started Create"
    question = @question_service.ask_question
    render json: question, status: :created
  end

  def destroy
    @question_service.delete_question(params[:id])
  end

  def answered_questions
    questions=[]
    user= User.find(params[:id])
    if(user)
      user.answers.each do |answer|
        questions.push(answer.question)
      end
      render json: questions, include: 'tags'
    else
      raise 'User not found'
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
    params.require("question").permit(:title,:body, :id)
  end
end
