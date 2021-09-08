class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  def create_notification_comment(current_user,comment.id)
    #自分以外で投稿にコメントしている全てのユーザーIDを取得し通知を送るための検索
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user).disinct
    #複数回コメントがきてもその都度通知を送るためにレコードを作成する
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temo_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    if temp_ids.blank?
      save_notification_comment!(current_user, comment_id, user_id)

    def save_notification_comment!(current_user, comment_id, visited_id)
      notification = current_user.active_notifications.new(
        post_id: id,
        comment_id: comment_id,
        visited_id: visited_id,
        action: 'comment'
      )

      # 自分の投稿に対するコメントの場合は通知済みとする
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
