class UserController < ApplicationController
  before_action :initialize_user_service, only: [:sign_up, :update_user]

  #show all users
  def index
    render json: UserService.showAll, each_serializer: UserSerializer, includes: 'tags'
  end

  #create new user
  def signup
    @user_service.sign_up
  end

  #get a particular user
  def show
    render json: UserService.get_user(params[:id]), includes: 'tags, questions, answers'
  end

  #update details of user
  def update_user
    @user_service.update_user
  end

  #delete a user
  def destroy_user
    UserService.destroy_user(params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email_id, :password, :password_confirmation)
  end

  #initialize user service
  def initialize_user_service
    @user_service = UserService.new(user_params[:user])
  end
end
