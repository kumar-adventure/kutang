class ResetPasswordsController < ApplicationController
  before_filter :user_remembered?

  def edit
    @user = User.find_by_token(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to login_url, notice: 'Password changed successfully.'
    else
      redirect_to login_url, notice: 'Password not changed.'
    end

  end
end
