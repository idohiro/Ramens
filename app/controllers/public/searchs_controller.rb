class Public::SearchsController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
      redirect_to public_search_result_path
    else
      @ramens = Ramen.looks(params[:search], params[:word])
       redirect_to public_search_result_path
    end
  end

  def search_result
     @customers = Customer.looks(params[:search], params[:word])
   @ramens = Ramen.looks(params[:search], params[:word])
  end
end
