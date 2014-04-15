class ProductsController < ApplicationController

    before_filter :authenticate

    def index

        @products = Product.all

    end 

    def show

        @product = Product.find_by(id: params[:id])

        @reviews = @product.reviews

        @user = session[:user_id]
        
    end 

    def user_index

        @products = User.find_by(id: session[:user_id]).products

        

    end 


end
