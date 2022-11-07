class LessonsController < ApplicationController
  before_action :set_college

  def index
    @lessons = @college.lessons
    @q = @lessons.ransack(params[:q])
    @search_results = @q.result(distinct: true)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to college_lessons_url, notice: "クラスを登録しました！"
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @course_reviews = @lesson.course_reviews.order(created_at: :desc)
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to college_lessons_url, notice: "クラスの情報を更新しました"
    else
      render :edit
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :professor, :department, :college_id)
  end

  def set_college
    @college = College.find(params[:college_id])
  end
end
