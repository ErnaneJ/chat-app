class RoomsController < ApplicationController

  before_action :current_user_is_authenticated?
  
  def index
    @current_user = current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new

    @messages = @single_room.messages
    @message = Message.new
  
    render "index"
  rescue
    redirect_to :root
  end

  def create
    @room = Room.create(name: params["room"]["name"])
    redirect_to room_path(@room.id)
  end

  private

  def current_user_is_authenticated?
    redirect_to '/signin' unless current_user
  end
end