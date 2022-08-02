class CollegesController < ApplicationController
  def home
  end

  def show
    @college = College.find(params[:id])
    @collreviews = @college.collreviews
  end
end
