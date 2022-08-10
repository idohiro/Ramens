class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
