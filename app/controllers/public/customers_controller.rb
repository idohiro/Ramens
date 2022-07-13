class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def index
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
        render "edit"
    else
      redirect_to public_customer_path(@customer)
    end
  end
  def update
    @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     if @customer.save
      redirect_to public_customer_path(), notice: "You have updated user successfully."
     else
      render "edit"
     end
  end

  def confirm
  end

  def withdraw
  end

   def customer_params
    params.require(:customer).permit( :email, :name)
   end

end
