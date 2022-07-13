class Public::RamensController < ApplicationController
  def index
    @ramens = Ramen.all
    @ramen =  Ramen.find(params[:id])
  end

  def new
    @ramen = Ramen.new
  end

  def edit
  end

  def show
    @ramen =  Ramen.find(params[:id])
  end
end

 def create
    @ramen = Ramen.new(public_ramen_params)
    if @ramen.save
      redirect_to public_customer_path
    else
      render :new
    end
 end


  private
  def public_ramen_params
    params.require(:ramen).permit(:name, :shop_name, :ramen_image, :introduction, :price, :limited_information)
  end
