class CollegesController < ApplicationController
  # before_action :search_college, only: %i[index search_result]
  def index
    @q = College.ransack(params[:q])
    @colleges = @q.result(distinct: true)
  end

  def show
    @college = College.find(params[:id])
    @collreviews = @college.collreviews
  end
end
