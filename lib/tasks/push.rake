namespace :push_line do 
  desc "LINEBOT：ゴミ出しの通知" 
  task push_line_message_trash: :environment do
      trash_day = TrashDay.new
      message = {
          type: 'text',
          text: trash_day.text
      }
      client = Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
      User.all.each do |user|
          client.push_message(user.uid, message)
      end
  end
end

class DataHelper
  def week_of_month_for_data(data)
    my_data = Time.zone.parse(data.to_s)
    week_of_target_Data = my_data.strftime("%U").to_i
    week_of_beginning_of_month = my_data.beginning_of_month.strftime("%U").to_i
    week_of_target_data - week_of_beginning_of_month + 1
  end
end

class TrashDay
  def text
    date = Date.today

    case date.strftime('%a')
      when "Mon"
          "ちょっとあんた！今日は月曜日、普通ゴミの日だわ！" + metal_text
      when "Tue"
          "ちょっとあんた！今日は火曜日、空き缶・ペットボトル・空き瓶・使用済み乾電池の日だわ！"
      when "Wed"
          "ちょっとあんた！今日は水曜日、プラスチック製容器包装の日だわ！"
      when "Thu"
          "ちょっとあんた！今日は木曜日、普通ゴミの日だわ！"
      when "Fri"
          "HEY BUDDY! It's Friday. Party hard. Don't drink too much.(ゴミ無しの日)"
      when "Sat"
          "ちょっとあんた！今日は土曜日、ミックスペーパーの日だわ！"
      else
          ""
      end
  end

  def metal_text
      date = Date.today
      week = DateHelper.new.week_of_month_for_date(date)
      day = date.strftime('%a')
      if week == 2 || week == 4
          "２・４回目の月曜日だから小物金属も忘れちゃダメよ！"
      else
          ""
      end
  end
end