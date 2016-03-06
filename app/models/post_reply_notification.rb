class PostReplyNotification < Notification
  belongs_to :post
  # code
  def content
    "You got reply to post #{origin.title}"
  end

  def post
    origin
  end

  def path
    origin
  end
end
