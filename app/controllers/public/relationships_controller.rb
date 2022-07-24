class Public::RelationshipsController < ApplicationController

  def followings
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings
  end

  def followers
     @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers
  end

   def create
    current_customer.followers(params[:customer_id])
    redirect_to request.referer
   end
  # フォロー外すとき
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
  # フォロー一覧

  # フォロワー一覧
end
