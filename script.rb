require 'telegram/bot'
require_relative 'api_key.rb'
puts Telegram::Bot::VERSION

token = $TELEGRAM_TOKEN

# Dir.glob("assets/*.{jpg,heic}")  

img_arr = Dir.glob("assets/*.{jpg,heic}")
  
p img_arr
p img_arr.length



Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/photo'
      random_photo = img_arr.sample
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(random_photo,  'image/jpeg'))
    end
  end
end