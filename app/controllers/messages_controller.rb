class MessagesController < ApplicationController
  require 'twilio-ruby'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_food_cart!, only: [:text_interface]

  def receive
    new_message = Message.create!(:body => params['Body'], :from_number => params['From'])
  end

  def reply
    @message = Message.find(params[:id])
    new_reply = @message.replies.create!(:to_phone_number => @message.from_number, :body => params[:reply_body])
    new_reply.send_reply
    respond_to do |format|
      format.html { redirect_to text_interface_messages_path }
      format.js
    end
  end

  def text_interface
    @all_messages = Message.all
    respond_to do |format|
      format.js
      format.html
    end
  end

end
