class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!, except: [:top,:about]


  def show
    @customer= Customer.find(params[:id])
  end

  def index
       @customers = Customer.all
    @ramen = Ramen.new
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
        render "edit"
    else
      redirect_to public_customer_path(current_customer)
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
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites= Favorite.where(customer_id: @customer.id).pluck(:ramen_id)
    @favorite_ramens = Ramen.find(favorites)
  end

   def customer_params
    params.require(:customer).permit( :email, :name)
   end

    private

   def ensure_correct_customer
    @Customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to public_customer_path(current_customer)
    end
   end


end
