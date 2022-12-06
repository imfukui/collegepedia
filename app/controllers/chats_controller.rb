class ChatsController < ApplicationController
  before_action :authenticate_user!
  def create
    chat = Chat.new(chat_params)
    chat.user_id = current_user.id
    if chat.save
      redirect_to room_path(chat.room)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def chat_params
      params.require(:chat).permit(:room_id, :message)
    end
end
