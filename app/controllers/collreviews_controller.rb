class CollreviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @college = College.find(params[:college_id])
    @collreview = Collreview.new
  end

  def create
    @college = College.find(params[:college_id])
    @collreview = Collreview.new(collreview_params)
    if @collreview.save
      redirect_to '/', notice: "学校の評価を作成しました！"
    else
      render :new
    end
  end

  def edit
    @collreview = Collreview.find(params[:id])
    if @collreview.user_id != current_user.id
      redirect_to '/'
    end
  end

  def update
    @collreview = Collreview.find(params[:id])
    if current_user.id == @collreview.user_id && @collreview.update(collreview_params)
      redirect_to user_path(current_user), notice: "学校の評価を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @collreview = Collreview.find(params[:id])
    if current_user.id == @collreview.user_id && @collreview.destroy
      redirect_to user_path(current_user), notice: "学校の評価を削除しました"
    else
      redirect_to '/', alert: "削除できませんでした"
    end
  end

  private

  def collreview_params
    params.require(:collreview).permit(:sub, :tuition, :scale, :environment, :pros, :cons, :user_id, :college_id)
  end
end
