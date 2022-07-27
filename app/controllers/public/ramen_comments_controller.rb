class Public::RamenCommentsController < ApplicationController
  def create
    @comment = RamenComment.new(ramen_comments_params)
    if @comment.save
      redirect_to public_ramen_path(@comment.ramen)
    else
      @ramen = @comment.ramen
      render "ramens/show"
    end
  end

  def destroy
    @comment = RamenComment.find_by(id: params[:id], ramen_id: params[:ramen_id])
    @comment.destroy
    redirect_to public_ramen_path(@comment.ramen)
  end

private
  def ramen_comments_params
    params.require(:ramen_comment).permit(:body).merge(customer_id: current_customer.id, ramen_id: params[:ramen_id])
  end

end
