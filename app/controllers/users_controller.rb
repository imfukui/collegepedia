class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to '/', notice: 'ゲストとしてログインしました'
  end
end
