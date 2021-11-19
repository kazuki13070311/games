class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    # ユーザー新規作成フォーム用に空のユーザーオブジェクトを作る
    @user = User.new
  end

  def index
    @users = User.all.sort_by{ |user| user.name.gsub(/(\d+)/) { |a| a - a} }
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(root_path, notice: '新規登録できました')
    else
      flash[:alert] = '登録失敗'
      render :new
    end
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
