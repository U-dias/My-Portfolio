class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    Rails.logger.debug "USER_ID: #{@user.object_id}"
Rails.logger.debug "ERRORS: #{@user.errors.full_messages}"
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      Rails.logger.debug "CREATE USER ID: #{@user.object_id}"
    else
      render :new
      Rails.logger.debug "失敗ルート通過"
      Rails.logger.debug "ERROR USER ID: #{@user.object_id}"
    end
  end
  def show
    @current_user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
