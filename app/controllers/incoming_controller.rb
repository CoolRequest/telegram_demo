class IncomingController < ApplicationController
  def index
    received = Received.find_by(chat_id: session[:chat_id])
    @data = JSON.parse(received.webhook_params) if received.present?
  end
end
