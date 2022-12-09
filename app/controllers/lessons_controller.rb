class LessonsController < ApplicationController
  before_action :set_college

  def index
    if params[:high_rate]
      lessons_array = Lesson.find(Lesson.joins(:course_reviews).where(college_id: @college).group("course_reviews.lesson_id").order('avg(course_reviews.rate) desc').pluck(:lesson_id))
      @lessons = Kaminari.paginate_array(lessons_array).page(params[:page]).per(5)
      @q = @college.lessons.ransack(params[:q])
    elsif params[:low_rate]
      lessons_array = Lesson.find(Lesson.joins(:course_reviews).where(college_id: @college).group("course_reviews.lesson_id").order('avg(course_reviews.rate)').pluck(:lesson_id))
      @lessons = Kaminari.paginate_array(lessons_array).page(params[:page]).per(5)
      @q = @college.lessons.ransack(params[:q])
    else
      @lessons = @college.lessons.order(created_at: :desc).page(params[:page]).per(5)
      @q = @lessons.ransack(params[:q])
    end
    @search_results = @q.result
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
    @avr = CourseReview.where(lesson_id: params[:id]).average(:rate).round
    @course_reviews = @lesson.course_reviews.order(created_at: :desc).page(params[:page]).per(5)
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

  def better_course
  end

  def worse_course
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :professor, :department, :college_id)
  end

  def set_college
    @college = College.find(params[:college_id])
  end
end
