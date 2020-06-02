class DashboardDetailsController < ApplicationController
    def index
    @dashboard_details = Dashboard_detail.all
  end

  def show
    @dashboard_detail = Dashboard_detail.find(params[:id])
  end

  def new
    @dashboard_detail = Dashboard_detail.new
  end

  def create
    @dashboard_detail = Dashboard_detail.new(dashboard_detail_params)
    if @dashboard_detail.save
      redirect_to dashboard_dashboard_details_path(@dashboard_detail)
    else
      render 'new'
    end
  end

  def destroy
    @dashboard_detail = dashboard_detail.find(params[:id])
    @dashboard_detail.destroy
    redirect_to dashboard_dashboard_details_path
  end


  private

  def dashboard_detail_params
    params.require(:dashboard_detail).permit(:name)
  end
end
