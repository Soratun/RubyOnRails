class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path
        else
            render :new , status: :unprocessable_entity
        end
    end

    def show 
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit , status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end

    def confirm_destroy
        @user = User.find(params[:id])
        render partial: 'confirm_destroy'
      end
    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :birthday, :gender, :email, :phonenumber, :subject)
    end
end
