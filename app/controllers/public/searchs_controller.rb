class Public::SearchsController < ApplicationController
  def search
    @model = params[:model]
  	@content = params[:content]
		@method = params[:method]
    # if @range == "customer"
    #   @customers = Customer.looks(params[:search], params[:word])
    #   redirect_to public_search_result_path()
    # else
    #   @ramens = Ramen.looks(params[:search], params[:word])
    #   redirect_to public_search_result_path()
    # end
   if @model == 'customer'
			@records = Customer.search_for(@content, @method)
	 else
			@records = Ramen.search_for(@content, @method)
	 end

  end
  # def search_result
  #   @customers = Customer.looks(params[:search], params[:word])
  #   @ramens = Ramen.looks(params[:search], params[:word])
  # end
end
