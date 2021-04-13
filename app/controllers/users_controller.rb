class UsersController < ApplicationController
  def update
    return unless redirect_if_anonymous

    @user = User.find(session[:user_id])
    @user[:locale] = user_params[:locale]

    if @user.update(user_params)
      flash[:notice] = "Settings updated!"
      redirect_to root_path
    else
      flash[:notice] = "Error on trying to update settings."
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:locale)
  end
end
