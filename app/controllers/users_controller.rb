class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @collreviews = @user.collreviews
    @course_reviews = @user.course_reviews
  end
end
