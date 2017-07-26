class MessagesController < ApplicationController
  require 'twilio-ruby'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_food_cart!, only: [:text_interface]



  def receive
    new_message = Message.create!(:body => params['Body'], :from_number => params['From'])
  end

  def reply
    @message = Message.find(params[:id])
    reply = Reply.create!(:body => params[:reply])
    boot_twilio
    sms = @client.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: @message.from_number,
    body: reply.body
    )
    redirect_to text_interface_messages_path
  end

  def text_interface
    @all_messages = Message.all
    @all_replies = Reply.all
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
