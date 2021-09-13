class NotificationMailer < ApplicationMailer
  def comment_create(comment)
    @user = comment.user
    @comment = comment
    @post = comment.post
    mail(
      subject: "#{@user.name}さんからコメントがありました",
      to: @user.email
    )
  end
end
