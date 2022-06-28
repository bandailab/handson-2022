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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
     
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to @user
      else
        flash[:danger] = 'ユーザー情報の編集に失敗しました。'
        redirect_to edit_user_path
      end   
     
    else
        redirect_to root_url
    end
  end  

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
  
end
