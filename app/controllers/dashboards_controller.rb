class DashboardsController < ApplicationController
  def show
  end

  def my_booking
    @bookings = current_user.bookings
  end

  def my_friernd
    @friends = current_user.friends
  end
end
