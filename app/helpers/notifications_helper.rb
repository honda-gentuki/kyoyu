module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_post = link_to 'あなたの投稿', post_path(notification), style: 'font-weight: bold;'
    @visiter_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentか
    case notification.action
      when 'follow'
        tag.a(notification.visiter.nickname, href: user_path(@visiter), style: 'font-weight: bold;') + 'があなたをフォローしました'
      when 'like'
        tag.a(notification.visiter.nickname, href: user_path(@visiter),
                                            style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id),
                                                                                                  style: 'font-weight: bold;') + 'にいいねしました'
      when 'comment'
        @comment = Comment.find_by(id: @visiter_comment)&.content
        tag.a(@visiter.nickname, href: user_path(@visiter),
                                style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id),
                                                                                      style: 'font-weight: bold;') + 'にコメントしました'
      when 'chat'
        @chat = Chat.find_by(id: @visiter_chat)&.message
        tag.a(@visiter.nickname, href: chat_path(@visiter),
                               style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: chat_path(notification.chat_id),
                                                                                    style: 'font-weight: bold;') + 'にコメントしました'
      end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
