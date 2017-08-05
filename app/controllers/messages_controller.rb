class MessagesController < ApplicationController
  require 'twilio-ruby'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_food_cart!, only: [:text_interface]

  def receive
    # grab the phone number from the incoming message
    from_number = params['From']
    # find subscriber in the database or create a new one
    subscriber = Subscriber.find_or_create_by(from_number: from_number)

    subscriber.messages.create!(:body => params['Body'])

    binding.pry
  end

  def reply
    subscriber = Subscriber.find(params[:id])
    message = subscriber.messages.last
    new_reply = message.replies.create!(:to_phone_number => subscriber.from_number, :body => params[:reply_body])
    new_reply.send_reply
    respond_to do |format|
      format.html
      format.js
    end
  end

  def text_interface
    if params.has_key?(:subscriber_id)
      @subscriber = (Subscriber.find(params[:subscriber_id]))
      session[:subscriber_id] = @subscriber.id
    end
    @subscribers = Subscriber.all
    respond_to do |format|
      format.js
      format.html
    end
  end

end
