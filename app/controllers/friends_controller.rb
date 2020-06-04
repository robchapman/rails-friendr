class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :destroy, :edit, :update]
  def index
    if params[:query].present?
      @friends = Friend.global_search(params[:query]).select { |friend| friend.geocoded? }
    else
      @friends = Friend.geocoded
    end
    # friends.near(location search)
    @markers = @friends.map do |friend|
    {
      lat: friend.latitude,
      lng: friend.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { friend: friend }),
      image_url: helpers.asset_url('map_icon.png')
    }
    end

  end

  def show
    @booking = Booking.new
    @markers =
      [{
        lat: @friend.latitude,
        lng: @friend.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { friend: @friend }),
        image_url: helpers.asset_url('map_icon.png')
      }]
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

private
  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:name, :description, :photo, :price, :location)
  end
end
