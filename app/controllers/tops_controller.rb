class TopsController < ApplicationController
  def top
    @users = User.all
  end
end
