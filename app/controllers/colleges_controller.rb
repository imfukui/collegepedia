class CollegesController < ApplicationController
  before_action :if_admin, only: %i[new create edit update destroy]

  def index
    @q = College.ransack(params[:q])
    @search_results = @q.result(distinct: true)
    @colleges = College.order(created_at: :desc).limit(5)
  end

  def new
    @college = College.new
  end

  def create
    @college = College.new(college_params)
    if @college.save
      redirect_to '/', notice: "新しいcollegeを登録しました"
    else
      render :new
    end
  end

  def show
    @college = College.find(params[:id])
    @collreviews = @college.collreviews
  end

  def edit
    @college = College.find(params[:id])
  end

  def update
    @college = College.find(params[:id])
    if @college.update(college_params)
      redirect_to college_path(college), notice: "学校の情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @college = College.find(params[:id])
    if @college.destroy
      redirect_to '/', notice: "学校の登録を削除しました"
    else
      redirect_to college_path(college), alert: "学校の登録を削除できませんでした"
    end
  end

  private

  def college_params
    params.require(:college).permit(:name, :address, :sector, :estyear, :mingpa, :description)
  end

  def if_admin
    redirect_to '/' unless current_user.admin?
  end
end
