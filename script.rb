require 'telegram/bot'
require_relative 'api_key.rb'
puts Telegram::Bot::VERSION

token = $TELEGRAM_TOKEN
img = "IMG_9622.JPG"
img2 = "IMG_6946.HEIC"
img_arr = Dir.foreach("./assets").select { |x| File.file?("#{"./assets"}/#{x}") }
p img_arr

# 1. Make script to choose random image from assets folder
# 2. Let people add the bot to their channel/group
# 2.1 Make array with img names
# 3. Make bot for discord too

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/photo'
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new("./assets/#{img2}",  'image/jpeg'))
    end
  end
end