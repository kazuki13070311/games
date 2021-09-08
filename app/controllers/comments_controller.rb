class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params_comment)
    @post = @cmment.post
    @comment.user_id = current_user.id
    if @comment.save
      post.active_noyications!(current_user, @comment.id)
      redirect_back(fallback_location: root_path, notice: '投稿が完了しました。')
    else
      redirect_back(fallback_location: root_path, notice: '投稿に失敗しました。')
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      redirect_back(fallback_location: root_path, notice: "コメントを削除しました")
    else
      redirect_back(fallback_location: root_path, notice: '削除に失敗しました。')
    end 
  end

  private

    def params_comment
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
