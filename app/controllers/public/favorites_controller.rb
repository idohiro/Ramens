class Public::FavoritesController < ApplicationController
  def create
      ramen = Ramen.find(params[:ramen_id])
    @favorite = current_user.favorites.new(ramen_id: ramen.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    ramen = Ramen.find(params[:ramen_id])
    @favorite = current_user.favorites.find_by(ramen_id: ramen.id)
    @favorite.destroy
    render 'replace_btn'
  end
end
