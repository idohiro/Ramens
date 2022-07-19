class Public::RamensController < ApplicationController
  def index
    @ramens = Ramen.all
     @ramen = Ramen.new
  end

  def new
    @ramen = Ramen.new
  end

  def edit
    @ramen =  Ramen.find(params[:id])
  end

  def show
    @ramen =  Ramen.find(params[:id])
  end

  def create
    #byebug
    @ramen = Ramen.new(public_ramen_params)

    if @ramen.save
      redirect_to public_customer_path(current_customer)
    else
      render :new
    end
  end

  def update
     @ramen = Ramen.find(params[:id])
    if @ramen.update(public_ramen_params)
      redirect_to public_ramen_path(@ramen), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @ramen = Ramen.find(params[:id])
    @ramen.destroy
    redirect_to public_ramens_path
  end

  private
  def public_ramen_params
    params.require(:ramen).permit(:name, :shop_name, :ramen_image, :introduction, :price, :limited_information)
  end
end
