class UsersController < ApplicationController


    def new
        @user = User.new
    end 

    def create

        @user = User.new(user_params)

        if @user.save 
            @user_info = Userinfo.new(userinfo_params)
            @user_info.user_id = @user.id

                if @user_info.save
                session[:user_id] = @user.id
                session[:expire_on] = SESSION_EXPIRY_MINUTES.minutes.from_now
                redirect_to products_path, :notice => "Sign up successful. Welcome #{@user.userinfo.first_name}!"
                else
                render :action => :new
                end
        else
            render :action => :new
        end

    end 


    def destroy

        @user_id = params[:id]

        Userinfo.find_by(user_id: @user_id).update_attributes(active_status: 0)

        redirect_to products_path

    end 

    private

    def user_params

        params.require(:user).permit(:user_name,:password,:password_confirmation)

    end  

    def userinfo_params

        params.require(:userinfo).permit(:first_name,:last_name,:active_status)

    end 

end
