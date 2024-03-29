class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

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
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @post.user
     
      if @post.update(post_params)
        flash[:success] = '投稿を編集しました。'
        redirect_to @post
      else
        render 'edit', status: :unprocessable_entity
      end   
     
    else
        redirect_to root_url
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
