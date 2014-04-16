class ProductsController < ApplicationController

    before_filter :authenticate

    def index

        @products = Product.all

    end 

    def show

        @product = Product.find_by(id: params[:id])

        @reviews = @product.reviews.order(:created_at => :desc)

        @user = session[:user_id]
        
    end 

    def new
    
        @product = Product.new

    end 

    def create

        @product = Product.new(product_params)

        if @product.save
            redirect_to product_path(@product)
        else 
            render 'new'
        end 

    end 


    def user_index

        @products = User.find_by(id: session[:user_id]).products

    end 

    def edit

        @product = Product.find_by(id: params[:id])

    end 

    def update

        @product = Product.find_by(id: params[:id])

        if @product.update_attributes(product_params)
            redirect_to products_path
        else 
            render action: :edit
        end 

    end 

    def destroy

        Product.destroy(params[:id])

        redirect_to products_path

    end 

    private

    def product_params

        params.require(:product).permit(:name,:category,:price,:description,:image_url)

    end 

end
