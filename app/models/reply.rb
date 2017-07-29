class Reply < ApplicationRecord
  require 'twilio-ruby'
  belongs_to :message

  def client
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    Twilio::REST::Client.new account_sid, auth_token
  end

  def send_reply
    client.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: self.to_phone_number,
    body: self.body
    )
  end


end
