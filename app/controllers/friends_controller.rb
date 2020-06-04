class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :destroy, :edit, :update]
  def index


    if params[:query].present?
      @friends = Friend.global_search(params[:query])
    else
      @friends = Friend.all
    end
  end

  def show

  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
      if @friend.save
        redirect_to friend_path(@friend)
      else
        render 'new'
      end
  end

  def update
    @friend.update(friend_params)
    redirect_to friend_path(@friend)
  end

  def edit
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end

  def bookings

    # TODO
  end

private
  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:name, :description, :photo, :price, :location)
  end

end

