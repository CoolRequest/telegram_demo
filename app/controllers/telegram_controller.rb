# app/controllers/telegram_controller.rb
class TelegramController < ActionController::API

  def webhook
    # whenever someone sends a message to the bot, this action gets called
    logger.info 'received message'
    if params[:message][:text] == 'hello'
      logger.info 'sending reply'
      chat_id = params[:message][:chat][:id]
      send_message chat_id, "Your chat id is #{chat_id}"
    end
  end

  private

  def send_message(chat_id, text)
    bot_token = ENV['BOT_TOKEN']
    response = HTTP.post("https://api.telegram.org/bot#{bot_token}/sendMessage", json: { chat_id: chat_id, text: text })
    puts response.body
  end

end
