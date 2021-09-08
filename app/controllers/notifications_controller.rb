class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications
    # whereでチェックがfalseの通知のみ取り出す様にしている
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
