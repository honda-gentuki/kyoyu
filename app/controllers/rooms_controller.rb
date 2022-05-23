class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
      @room = Room.all
  end
end
