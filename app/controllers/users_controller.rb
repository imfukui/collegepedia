class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @collreviews = @user.collreviews
    @course_reviews = @user.course_reviews

    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless current_user.id == @user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
