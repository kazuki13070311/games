class TopsController < ApplicationController
  def top
    @users = User.all.order(created_at: :desc)
    @posts = Post.includes(:user).all.order(created_at: :desc)
  end
end
