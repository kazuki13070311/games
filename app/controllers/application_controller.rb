class ApplicationController < ActionController::Base
  #sorceryが作成するメソッド。ログインしてない時not_authenticatedメソッドを発火する
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_url
  end
end
