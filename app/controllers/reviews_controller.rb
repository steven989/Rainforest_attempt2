class ReviewsController < ApplicationController

    def create

        product = Product.find_by(id: params[:product_id])

        product.reviews.new(review_params).save

        redirect_to product_path(product)

    end 


    private

    def review_params

        params.require(:review).permit(:title, :content, :user_id)

    end 

end
