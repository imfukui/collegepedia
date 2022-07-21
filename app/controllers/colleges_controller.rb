class CollegesController < ApplicationController
  def home
  end

  def show
    @college=College.find(params[:id])
  end
end
