class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params_comment)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path,notice: '投稿が完了しました。')
    else
      redirect_back(fallback_location: root_path,notice: '投稿に失敗しました。')
    end
  end

  private

    def params_comment
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
