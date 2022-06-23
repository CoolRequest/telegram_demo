# app/controllers/telegram_controller.rb
class TelegramController < ActionController::API
  def webhook
    # whenever someone sends a message to the bot, this action gets called
    Rails.logger.info 'telegram#webhook'
  end
end
