class CourseReviewsController < ApplicationController
  before_action :set_college_and_lesson, only: %i[new]

  def new
    @course_review = CourseReview.new
  end

  def create
    @course_review = CourseReview.new(course_review_params)
    if @course_review.save!
      redirect_to '/', notice: "コースの評価を追加しました！"
    else
      redirect_to :back, alert: "コースの評価を追加できませんでした！"
    end
  end

  def edit
    @course_review = CourseReview.find(params[:id])
  end

  def update
    @course_review = CourseReview.find(params[:id])
    if @course_review.user_id == current_user.id
      @course_review.update!(course_review_params)
      redirect_to user_path(current_user), notice: "更新しました！"
    else
      redirect_to :back, alert: "更新できませんでした"
    end
  end

  def destroy
    @course_review = CourseReview.find(params[:id])
    if @course_review.user_id == current_user.id
      @course_review.destroy
      redirect_to user_path(current_user), notice: "削除しました"
    else
      redirect_to '/', alert: "削除できませんでした"
    end
  end

  private

  def course_review_params
    params.require(:course_review).permit(:exam, :quiz, :assignment, :gradedist, :comment, :gradegot, :lesson_id, :user_id)
  end

  def set_college_and_lesson
    @college = College.find(params[:college_id])
    @lesson = Lesson.find(params[:lesson_id])
  end
end
