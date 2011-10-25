class CakesController < ApplicationController
  def index
    @cakes=Cake.all
    @special = Cake.first
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new params[:cake]
    @cake.save
    redirect_to :action=>:new
  end
  def update
    @cake = cake.find_by_id params[:id]

  end
  def destroy
    @cake = Cake.find_by_id params[:id]
    @cake.delete
    redirect_to :action=>:index
  end
  def upload_photo
    @cake = Cake.find_by_id params[:id]
    @photo = params[:cake]
  end
end
