class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token

  #login
  def authenticate
    user = User.not_deleted.find_by(email_id: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      render json: user, status: :ok
    else
      render status: :unauthorized
    end
  end

  private

  def session_params
    params.require("session").permit(:email, :password)
  end
end
