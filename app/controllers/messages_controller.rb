
class MessagesController < ApplicationController

  def create
    notification = Notification.find_by(slug: params["message"]["key"])
    if notification.present?
        message = Message.new(notification_id: notification.id, content: notification.message)
		
        if message.notification.captureSource == 0
		  
            if message.notification.isSetIcon == 1
                icon_id = message.notification.icon
                icon_url = Icon.find_by(id: icon_id).attachment_url
            end

            if message.save
              ActionCable.server.broadcast 'messages',
                                           nid: message.notification.id,
                                           captureSource: message.notification.captureSource,
                                           message: message.notification.message,
                                           fontFamily: message.notification.fontFamily,
                                           fontSize: message.notification.fontSize,
                                           fontColor: message.notification.fontColor,
                                           backgroundColor: message.notification.backgroundColor,
                                           borderRadius: message.notification.borderRadius,
                                           corner: message.notification.corner,
                                           time_after: message.notification.time_after,
                                           duration: message.notification.duration,
                                           isSetIcon: message.notification.isSetIcon,
                                           messageAlignment: message.notification.messageAlignment,
                                           iconUrl: icon_url
              # user: message.user.username
              head :ok
            end
        end
    end
  end

  private

  def message_params
	params.permit(:key)
  end
end
