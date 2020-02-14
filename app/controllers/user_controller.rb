class UserController < ApplicationController
  before_action :initialize_user_service, only: [:create, :update]
  skip_before_action :verify_authenticity_token
  #show all users
  def index
    render json: UserService.showAll, each_serializer: UserSerializer, includes: 'tags'
  end

  #create new user
  def create
    user = @user_service.sign_up
    render json: user, status: :created
  end

  #get a particular user
  def show
    render json: UserService.get_user(params[:id]), includes: 'tags, questions, answers'
  end

  #update details of user
  def update
    user = @user_service.update_user(params[:id])
    render json: user, status: :ok
  end

  #delete a user
  def destroy
    user = UserService.destroy_user(params[:id])
    render json: user, status: :ok
  end

  def search
    response = User.not_deleted.select(:id).where("name LIKE ?", "%#{params[:search]}%")
    if(response.empty?)
      render status: :not_found
    else
      render json: response.to_json, status: :found
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit("name", "email_id", "password", "password_confirmation","id")
  end

  #initialize user service
  def initialize_user_service
    @user_service = UserService.new(user_params)
  end
end
