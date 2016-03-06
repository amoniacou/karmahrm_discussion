class PostObserver < ActiveRecord::Observer
  def after_save(post)
    if post.parent.present?
      PostReplyNotification.create(user: post.employee.user, origin: post.parent)
    end
  end
end
