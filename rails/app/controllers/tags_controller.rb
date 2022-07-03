class TagsController < ApplicationController
  def new
    if logged_in?
      @tag = Tag.new
    else 
      redirect_to root_path
    end
    
  end

  def create
    user = current_user
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "登録しました!"
      redirect_to new_post_path
    else
      flash[:danger] = "登録に失敗しました。"
      redirect_to new_tag_path
    end
  end

  private
    def tag_params
      params.require(:tag).permit(
        :name,
      )
    end
end
