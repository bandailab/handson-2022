class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : @user.Posts.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録に成功しました!"
      log_in @user
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @users = params[:grade_id].present? ? Grade.find(params[:grade_id]).users : User.all.order(grade_id: "DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
     
      if @user.update(user_params_edit)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to @user
      else
        render 'edit', status: :unprocessable_entity
      end   
     
    else
        redirect_to root_url
    end
  end  

  private
    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :grade_id,
        :research_theme,
        :introduction,
      )
    end

    def user_params_edit
      params.require(:user).permit(
        :name,
        :email,
        :grade_id,
        :research_theme,
        :introduction,
      )
    end
  
end
