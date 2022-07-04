class SendingController < ApplicationController
  
  def new
  end

  def create
    send_message session[:chat_id], params[:message]
    redirect_to sending_path
  end

  private

  def send_message(chat_id, text)
    bot_token = ENV['BOT_TOKEN']
    response = HTTP.post("https://api.telegram.org/bot#{bot_token}/sendMessage", json: { chat_id: chat_id, text: text })
    puts response.body
  end
  
end
