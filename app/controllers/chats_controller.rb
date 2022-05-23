class ChatsController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.all
    @chats = Chat.all
  end

  def show
    @user = User.find(params[:id])
    rooms = current_user.room_users.pluck(:room_id)
    room_users = RoomUser.find_by(user_id: @user.id, room_id: rooms)
    room = nil
    if room_users.nil?
      @room = Room.new
      @room.save
      RoomUser.create(user_id: @user.id, room_id: @room.id)
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = room_users.room
    end

    @chats = @room.chats.includes(:user).order(:id)
    @chat = Chat.new(room_id: @room.id)
    @read = Read.update(complete: true) if Read.create(chat_id: @chat.id, user_id: current_user.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
