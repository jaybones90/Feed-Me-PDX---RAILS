class PagesController < ApplicationController

  require 'twilio-ruby'

  def home
  end

  def text
    @all_messages = Message.all
  end





end
