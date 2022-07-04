# app/controllers/telegram_controller.rb
class TelegramController < ActionController::API

  def webhook
    # whenever someone sends a message to the bot, this action gets called
    logger.info 'received message'
    chat_id = params[:message][:chat][:id]
    text = params[:message][:text]
    if text == 'hello'
      logger.info 'sending reply'
      send_message chat_id, "Your chat id is #{chat_id}"
    else
      logger.info 'saving message'
      r = Received.find_or_create_by! chat_id: chat_id
      r.update! text: text, webhook_params: params.to_json
      send_message chat_id, "Refresh the screen on the demo app to see what was received on the webhook"
    end
  end

  private

  def send_message(chat_id, text)
    bot_token = ENV['BOT_TOKEN']
    response = HTTP.post("https://api.telegram.org/bot#{bot_token}/sendMessage", json: { chat_id: chat_id, text: text })
    puts response.body
  end

end
