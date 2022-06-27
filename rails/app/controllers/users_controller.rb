class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
    else
      flash[:alert] = "登録に失敗しました。"
      redirect_to signup_path
    end
  end

  def index
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :grade,
        :research_theme,
        :introduction,
      )
    end
  
end
