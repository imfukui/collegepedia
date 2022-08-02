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
      redirect_to '/'
    else
      render :show
    end
  end


  private

  def collreview_params
    params.require(:collreview).permit(:sub, :tuition, :scale, :environment, :pros, :cons, :user_id, :college_id)
  end

  def set_collreview
    @collreview = Collreview.find(params[:id])
    @college = College.find(params[:college_id])
  end
end
