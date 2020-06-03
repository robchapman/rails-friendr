class PagesController < ApplicationController
  def home
  end

  def dashboard
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def my_listings
    @friends = current_user.friends
  end

  def my_profile
  end

  def my_providing_bookings
  end
end
