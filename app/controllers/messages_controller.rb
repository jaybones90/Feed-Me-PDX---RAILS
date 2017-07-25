class MessagesController < ApplicationController
  require 'twilio-ruby'
  skip_before_action :verify_authenticity_token



  def receive
    new_message = Message.create(:body => params['Body'], :from_number => params['From'])
  end

  def reply
    @message = Message.find(params[:id])
    binding.pry
    boot_twilio
    sms = @client.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: @message.from_number,
    body: params[:message_to_send]
    )
    redirect_to 'pages#text'
  end

  def text_interface
    @all_messages = Message.all
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end