class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token

  #login
  def authenticate
    user = User.not_deleted.find_by(email_id: session_params[:email_id].downcase)
    if user && user.authenticate(session_params[:password])
      puts "Authenticated"
      user["remember"]= user.remember_token
      response = user.to_json
      render json: response, status: :ok
    else
      render status: :unauthorized
    end
  end

  def logout
    user = User.find(params["id"])
    user.forget
    render json: user.to_json, status: :ok
  end

  private

  def session_params
    params.require("session").permit(:email_id, :password)
  end
end
