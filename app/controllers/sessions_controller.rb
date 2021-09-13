class SessionsController < ApplicationController
  # ログインしていない状態でsessionコントローラーを使用する様にする為
  skip_before_action :require_login

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(root_path, notice: 'ログインしました')
    else
      flash[:alert] = 'ログイン失敗'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'ログアウトしました')
  end
end
