class UserController < ApplicationController
    before_action :authenticate_user!

    def home
    end

    def edit
        @user = User.find(params[:id])
    end

    def show 
        @users = User.all
    end

    def update
        if current_user.role == 'Manager'
            user = User.find(params[:id])
            user.update_attribute(:role, params[:role])
            flash[:success] = "Role Updated!"
            redirect_to show_users_path
        else
            flash[:danger] = "You are not allowed to Change a Role"
            redirect_to show_users_path
        end
    end
end
