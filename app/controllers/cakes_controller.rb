
class CakesController < ApplicationController
  def index
    @cakes=Cake.all
    @special = Cake.first
  end

  def new
    @cake = Cake.new

  end
  def update
    @cake = Cake.find_by_id params[:id]
    if @cake.nil?
      redirect_to :back
    else
      @cake.update_attributes params[:cake]
      @cake.save
      redirect_to :action=>:edit, :id=>@cake.id
    end
  end

  def create
    @cake = Cake.new params[:cake]
    @cake.save
    redirect_to :action=>:new
  end
  def edit
    puts params.inspect
    @cake = Cake.find_by_id params[:id]
    render 'new'
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
