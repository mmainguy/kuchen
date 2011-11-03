class CakePhotosController < ApplicationController
  def create
    puts "#####{params.inspect}"
    @cake = Cake.find_by_id params[:cake_id]
    @cake.cake_photos.create(params[:cake_photo])

    redirect_to edit_cake_path(:id=>@cake.id)

  end
end
