class UsersController < ApplicationController
    
    def show
        @user = current_user
    end

    def edit
        @user = User.find_by(params[:user])
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def user_params
        params.require(:user).permit(
          :full_name, 
          :gender,
          :ic_number,
          :driving_license,
          :number_plate,
          :email, 
          :password,
          :password_confirmation,
          )
      end
end
