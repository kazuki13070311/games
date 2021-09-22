class ReactionsController < ApplicationController
  def new
    @answer = Answer.find(params[:answer_id])
    @reaction = Reaction.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @reaction = Reaction.new(params_reaction)
    @reaction.user_id = current_user.id
    if @reaction.save
      redirect_to(questions_path, notice: '質問投稿が完了しました')
    else
      flash[:alert] = '投稿失敗'
      render :new
    end
  end

  def destroy
    reaction = Reaction.find(params[:id])
    if current_user.id == reaction.user.id
      reaction.destroy
      redirect_back(fallback_location: root_path, notice: 'コメントを削除しました')
    else
      redirect_back(fallback_location: root_path, notice: '削除に失敗しました。')
    end
  end


  private

  def params_reaction
    params.require(:reaction).permit(:body, :user_id, :answer_id)
  end
end
