require 'telegram/bot'
require_relative 'api_key.rb'
puts Telegram::Bot::VERSION

token = $TELEGRAM_TOKEN
# 1. Make telegram bot in telegram
# 2. Make script to choose random image from assets folder
# 3. Let people add the bot to their channel/group

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end