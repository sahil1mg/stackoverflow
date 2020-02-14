class TagController < ApplicationController
  before_action :initialize_tag_creator, only: [:create, :update]
  before_action :initialize_tag_adder, only: [:add_tags]
  skip_before_action :verify_authenticity_token

  def create
    tag = @tag_service.create_tags
    render json: tag, status: :created
  end

  def update
    tag = @tag_service.edit_tags(params[:id])
    render json: tag, status: :ok
  end

  def destroy
    tag = TagService::TagCreator.destroy_tag(params[:id])
    render json: tag, status: :ok
  end

  def index
    render json: TagService.show_tags
  end

  def show
    render json: TagService.show(params[:id])
  end

  def get_questions_for_tag
    render json: Tag.includes(questions: [:tags, :votes, :user]).find(params[:id]).questions, each_serializer: QuestionSerializer, include: 'tags'
  end

  def get_question_count_for_tags
    render json: Tag.joins(:questions).group(:tag_id).count
  end

  def search
    response = Tag.select(:id).where("label LIKE ?", "%#{params[:search]}%")
    if(response.empty?)
      render status: :not_found
    else
      render json: response.to_json, status: :found
    end
  end

  private

  def tag_params
    params.require("tag").permit( "label", "body", "id")
  end

  def initialize_tag_creator
    @tag_service = TagService::TagCreator.new(tag_params)
  end

  def initialize_tag_adder
    @tag_adder = TagService::TagAdder.new
  end

end
