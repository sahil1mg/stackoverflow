class TagController < ApplicationController
  before_action :initialize_tag_creator, only: [:create, :edit]
  before_action :initialize_tag_adder, only: [:add_tags]

  def create
    @tag_service.create_tags
  end

  def edit
    @tag_service.edit_tags(params[:id])
  end

  def destroy
    TagService::TagCreator.destroy_tag(params[:id])
  end

  def add_tags_to_question
    @tag_adder.add_tags(question_id, tags)
  end

  def update_tags_to_question
    @tag_adder.update_tags(question_id, tags)
  end

  def index
    render json: TagService.show_tags
  end

  def show
    render json: TagService.show(params[:id])
  end

  def get_questions_for_tag
    render json: Tag.find(params[:id]).questions, each_serializer: QuestionSerializer, include: 'tags'
  end

  private

  def tag_params
    params.require(:tag).permit( :label)
  end

  def initialize_tag_creator
    @tag_service = TagService::TagCreator.new(tag_params[:tag])
  end

  def initialize_tag_adder
    @tag_adder = TagService::TagAdder.new
  end

end
