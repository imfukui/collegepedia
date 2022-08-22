class CollreviewsController < ApplicationController
  before_action :authenticate_user!

  def show
    @collreview = Collreview.find(params[:id])
  end

  def new
    @collreview = Collreview.new
    @college = College.find(params[:college_id])
  end

  def create
    @collreview = Collreview.new(collreview_params)
    if @collreview.save!
      redirect_to '/', notice: "大学の評価を作成しました！"
    else
      render :new
    end
  end

  def edit
    @collreview = Collreview.find(params[:id])
  end

  def update
    @collreview = Collreview.find(params[:id])
    if current_user.id == @collreview.user_id
      @collreview.update!(collreview_params)
      redirect_to user_path(current_user.id), notice: "大学の評価を更新しました！"
    else
      redirect_to '/', alert: "更新できませんでした"
    end
  end

  def destroy
    @collreview = Collreview.find(params[:id])
    if current_user.id == @collreview.user_id
      @collreview.destroy
      redirect_to user_path(current_user.id), notice: "大学の評価を削除しました"
    else
      redirect_to '/', alert: "削除できません"
    end
  end

  private

  def collreview_params
    params.require(:collreview).permit(:sub, :tuition, :scale, :environment, :pros, :cons, :user_id, :college_id)
  end
end
