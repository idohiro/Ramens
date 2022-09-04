class Public::SearchsController < ApplicationController
  # def search
  #   @range = params[:range]
  #   if @range == "Customer"
  #     @customers = Customer.looks(params[:search], params[:word])
  #     redirect_to public_search_result_path()
  #   else
  #     @ramens = Ramen.looks(params[:search], params[:word])
  #     redirect_to public_search_result_path()
  #   end
  # end
  def search_result
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'Customer'
			@records = Customer.search_for(@content, @method)
		else
			@records = Ramen.search_for(@content, @method)
		end
  end
end
