class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :destroy, :edit, :update]
  def index
    @friends = Friend.geocoded
    if params[:query_attributes].present?
      @friends = Friend.global_search(params[:query_attributes])
    end
    @friends = @friends.near(params[:query_location], 5) if (params[:query_location].present? && !@friends.empty?)
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
