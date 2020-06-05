class UsersController < ApplicationController
  before_action :select_user
  # def show
  # end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to dashboard_path
  end

  private

  def select_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end
end

