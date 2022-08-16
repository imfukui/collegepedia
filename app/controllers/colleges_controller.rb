class CollegesController < ApplicationController
  def show
    @college = College.find(params[:id])
    @collreviews = @college.collreviews
  end
end
