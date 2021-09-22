class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params_answer)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_back(fallback_location: root_path, notice: '投稿が完了しました。')
    else
      redirect_back(fallback_location: root_path, notice: '投稿に失敗しました。')
    end
  end

  private

  def params_answer
    params.require(:answer).permit(:body, :user_id, :question_id)
  end
end
