require 'telegram/bot'
require_relative 'api_key.rb'
puts Telegram::Bot::VERSION

token = $TELEGRAM_TOKEN


img_arr = Dir.foreach("./assets").select { |x| File.file?("#{"./assets"}/#{x}") }
img_arr.delete('.DS_Store')
  
p img_arr
p img_arr.length


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
      random_photo = img_arr.sample
      # magic conversion
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new("./assets/#{random_photo}",  'image/jpeg'))
    end
  end
end