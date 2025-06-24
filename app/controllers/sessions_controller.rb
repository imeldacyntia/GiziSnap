class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }
  skip_forgery_protection
  skip_before_action :authenticate_request

  def new
  end

  def create
    user = User.authenticate_by(params.permit(:username, :password))

    if user
      respond_to do |format|
        format.json do
          render json: { Success: true, Message: "Login success", token: jwt_encode(user_id: user.id) }, status: :created
        end
        format.html do
          start_new_session_for(user)
          redirect_to after_authentication_url
        end
      end
    else
      respond_to do |format|
        format.json { render json: { Success: false, Message: "Wrong username / password" }, status: :unauthorized }
        format.html do
          redirect_to new_session_path, alert: "Try another email address or password."
        end
      end
    end
  end

  def show
    head :no_content
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
