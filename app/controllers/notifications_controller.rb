
require 'json'

class NotificationsController < ApplicationController

  def index
    if !logged_in?
      return;
    end

    @notifications = @current_user.notifications
  end
 
  def show
    # @notification = Notification.find_by(slug: params[:key])
    @message = Message.new
    # render :json => { corner: @notification.corner }
  end

  def new
    @notification = Notification.new
  end

  def create
    user = User.find_by(slug: params[:your_id])

    if user.present?
        @notification = Notification.new(:name => params[:name], :captureSource => params[:captureSource], :user_id => user.id,
                                       :displayUrls => params[:displayUrls], :message => params[:message], :time_after => params[:time_after],
                                       :duration => params[:duration], :fontFamily => params[:fontFamily], :fontSize => params[:fontSize],
                                       :fontColor => params[:fontColor], :backgroundColor => params[:backgroundColor], :opacity => params[:opacity],
                                       :corner => params[:corner], :borderRadius => params[:borderRadius], :icon => params[:icon],
                                       :isSetIcon => params[:isSetIcon], :messageAlignment => params[:messageAlignment])

        if @notification.save
          slug = Array.new(32){rand(36).to_s(36)}.join + "_" + @notification.id.to_s
          @notification.update(slug: slug)

          if @notification.captureSource == 1
              hook = Array.new(48){rand(36).to_s(36)}.join + "#" + @notification.id.to_s
              hookUrl = "https://conversionincrease.herokuapp.com/notifications/webhookapi?hook="
              @notification.update(webhookUrl: hookUrl + hook)
          end
          render :json => { success: 1 }
        else
          render :json => { success: 0, errors: @notification.errors }
        end
    else
        render :json => { success: 0 }
    end
  end

  def grab
    id = User.find_by(slug: params[:your_id]).id
    @notifications = Notification.where(user_id: id)
    render :json => { notifications: @notifications }
  end

  def zapier_hook

    hook = params[:hook]

    if hook.present?
        hookUrl = "https://conversionincrease.herokuapp.com/notifications/webhookapi?hook=" + params[:hook].to_s
        notification = Notification.find_by(webhookUrl: hookUrl)

        if notification.present?
                
          keys = parseKeyNames(notification.message)

          if keys.present?
              realMessage = notification.message
              for i in 0..keys.length-1
                  if params[keys[i]].present?
                      realMessage = realMessage.gsub("{" + keys[i] + "}", params[keys[i]])
                  end
              end
              addNewMessage(notification, realMessage)
          end

        end
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  def destroy

  end

  def addNewMessage(notification, mes)

      message = Message.new(notification_id: notification.id, content: mes)

      if message.notification.isSetIcon == 1
        icon_id = message.notification.icon
        icon_url = Icon.find_by(id: icon_id).attachment_url
      end

      if message.save
        ActionCable.server.broadcast 'messages',
                                     nid: notification.id,
                                     captureSource: message.notification.captureSource,
                                     message: message.content,
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

  def parseKeyNames(message)

      str = message.split("\n")
      keys = [];

      if str.length < 1
        return keys
      end

      for i in 0..str.length-1

        if str[i].length < 1
            next
        end
        
        mark = 0
        s = ""
        
        for j in 0..str[i].length-1
            if str[i][j] != '{' && mark == 0
                next
            end
            
            if str[i][j] == '{'
                mark = 1
                next
            end

            if str[i][j] == '}'
                keys.push(s)
                s = ""
                mark = 0
                next
            end
            s += str[i][j].to_s
        end
      end

      return keys
  end

  private

  def notification_params
    params.permit(:name, :captureSource, :displayUrls, :message,
                  :time_after, :duration, :fontFamily, :fontSize,
                  :fontColor, :backgroundColor, :opacity, :borderRadius,
                  :corner, :isSetIcon, :messageAlignment, :icon, :your_id, :hook)
  end
end
