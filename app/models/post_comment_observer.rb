class PostCommentObserver < ActiveRecord::Observer
  def after_save(comment)
    PostCommentNotification.create(user: comment.user, origin: comment, path: comment.post)
  end
end
