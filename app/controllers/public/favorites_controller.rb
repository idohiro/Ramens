class Public::FavoritesController < ApplicationController
  def create
      @ramen = Ramen.find(params[:ramen_id])
    @favorite = current_customer.favorites.new(ramen_id: @ramen.id)
    @favorite.save

  end

  def destroy
    @ramen = Ramen.find(params[:ramen_id])
    @favorite = current_customer.favorites.find_by(ramen_id: @ramen.id)
    @favorite.destroy

  end
end
