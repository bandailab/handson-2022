class PostsController < ApplicationController
  def new
    if logged_in?
      @post = Post.new
      @post.post_tags.build
    else 
      redirect_to root_path
    end
  end

  def create
    user = current_user
    @post = Post.new(post_params)
    @post.user_id = user.id
    if @post.save
      flash[:success] = "投稿しました!"
      redirect_to user
    else
      flash[:danger] = "登録に失敗しました。"
      redirect_to new_post_path
    end
  end

  private
    def post_params
      params.require(:post).permit(
        { :tag_ids => [] },
        :title,
        :article,
      )
    end
end
