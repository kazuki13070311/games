class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:user).all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to(questions_path, notice: '質問投稿が完了しました')
    else
      flash[:alert] = '投稿失敗'
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_back(fallback_location: root_path, notice: 'ベストアンサーに指定しました')
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id, :best_answer_id)
  end
end
