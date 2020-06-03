class PagesController < ApplicationController
  before_action :set_friends, only: :my_listings

  def home
  end

  def dashboard
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def my_listings; end

  def my_profile
  end

  private

  def set_friends
    @friends = current_user.friends
  end
end
