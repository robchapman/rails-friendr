class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
    
  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
      if @friend.save
        redirect_to friend_path(@friend)
      else
        render 'new'
      end
  end
end
