class LessonsController < ApplicationController

  before_action :set_college, only: %i[index new show edit]

  def index
    @lessons = @college.lessons
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save!
      redirect_to '/', notice: "クラスを登録しました！"
    else
      redirect_to '/', alert: "クラスを作成できませんでした"
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update!(lesson_params)
      redirect_to action: :index, notice: "クラスの情報を更新しました"
    else
      redirect_to :back, alert: "クラスの情報を更新できませんでした"
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
