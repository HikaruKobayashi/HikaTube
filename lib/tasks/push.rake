namespace :push_line do 
  desc "HikaTube" 
  task push_line_message: :environment do
      message = {
          type: 'text',
          text: '8時だよ。YouTubeに集合!今夜はどんな動画がアップされているかな?'
      }
      client = Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
      response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
  end
end