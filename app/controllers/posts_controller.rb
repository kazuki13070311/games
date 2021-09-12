class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to(posts_path, notice: '投稿できました')
    else
      flash[:alert] = '投稿失敗'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user.id
      @post.destroy
      redirect_back(fallback_location: root_path, notice: "投稿を削除しました")
    else
      redirect_back(fallback_location: root_path, notice: '削除に失敗しました。')
    end 
  end

  private

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
