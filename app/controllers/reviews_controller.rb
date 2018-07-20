class ReviewsController < ApplicationController
  before_filter :authorize
  before_action :require_login

  def create 
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @product
    else
      render :back
    end
  end


  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def require_login
    redirect_to path_to_product unless current_user
  end
end
