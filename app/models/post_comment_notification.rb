class PostCommentNotification < Notification
  belongs_to :comment
  def content
    "You got comment to post #{origin.origin.title}"
  end
end
