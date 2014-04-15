class UsersController < ApplicationController


    def new
        @user = User.new
    end 

    def create

        @user = User.new(user_params)

        if @user.save
            redirect_to products_path
        else
            render :action => :new
        end

    end 


    def destroy

    end 

    private

    def user_params

        params.require(:user).permit(:user_name,:password,:password_confirmation)

    end  

end