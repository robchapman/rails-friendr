class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @friend = Friend.find(params[:friend_id])
    @booking = Booking.new
  end

  def create
    @friend = Friend.find(params[:friend_id])
    @booking = Booking.new(booking_params)
    @booking.friend = @friend
    @booking.user = current_user
    if @booking.start_time && @booking.end_time
      @booking.total_price = (@booking.end_time - @booking.start_time) / 60 / 60 * @friend.price
    end
    @booking.status = "pending"
      if @booking.save
        redirect_to booking_path(@booking)
      else
        render 'friends/show'
      end
  end


  def edit
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:friend_id, :user_id, :status, :start_time, :end_time, :total_price)
  end

end
#ADD DELETE AND EDIT BOOKING LATER
