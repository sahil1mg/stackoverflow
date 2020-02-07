class SessionController < ApplicationController
  before_action :initialize_session_service

  #login
  def create
    if(@session_service.login?(session_params[:session][:email_id], session_params[:session][:password]))
      redirect_to request.referrer || root_url
    end
  end

  #logout using log_out from helper method
  def destroy
    @session_service.log_out
    redirect_to root_url
  end

  private

  def session_params
    params.permit(:session).require(:email_id, :password)
  end

  def initialize_session_service
    @session_service = SessionService.new()
  end
end
