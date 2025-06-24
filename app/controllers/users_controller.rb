class UsersController < ApplicationController
  allow_unauthenticated_access
  skip_forgery_protection

  def index
    respond_to do |format|
      format.json { render json: { userinformation: @current_user, user_avatar: url_for(@current_user.avatar), userfoodshistory: @current_user.foods  } }
    end
  end

  def update
    if params[:avatar.present?]
      @current_user.avatar.attach(params[:avatar])
    end

    @current_user.update(user_params)

    if @current_user.save
      respond_to do |format|
        format.json { render json: { status: "success", message: "User information updated successfully." } }
      end
    else
      respond_to do |format|
        format.json { render json: { status: "error", message: @current_user.errors.full_messages.join(", ") } }
      end
    end
  end

  def destroy
  end

  private

  def user_params
    params.permit(:username, :email_address, :password, :avatar)
  end
end
