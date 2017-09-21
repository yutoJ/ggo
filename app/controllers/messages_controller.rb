class MessagesController < ApplicationController

  before_action :find_conversation

  def index
    if current_user = @conversation.sender || current_user == @conversation.recipient
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
    else
      redirect_to conversations_path, alert: "権限がありません"
    end
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages

    end

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    recipient_user = @conversation.target_user(current_user)
    respond_to do |format|
      if @message.save
        @notification = @message.notifications.build(user_id: recipient_user.id)
        @notification.save
        Pusher.trigger("user_#{recipient_user.id}_channel", 'notify_message', {
            message: 'あなたにメッセージが届いています'
          })
        Pusher.trigger("user_#{recipient_user.id}_channel", 'notify_unread', {
            unread_counts: Notification.where(user_id: recipient_user.id, read: false).count
          })
        format.js {render :create}
      else
        redirect_to notifications_index_path
      end
    end
  end

  private
  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

end
