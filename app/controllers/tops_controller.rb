class TopsController < ApplicationController
  def top
    @user = User.all
  end
end
