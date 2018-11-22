class UsersController < ApplicationController
    
    def show
        @user = current_user
    end

    def edit
        @user = User.find_by(params[:user])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to @user 
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
          :current_password
          )
      end
end
