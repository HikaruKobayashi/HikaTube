# class DataHelper
#   def week_of_month_for_data(data)
#     my_data = Time.zone.parse(data.to_s)
#     week_of_target_Data = my_data.strftime("%U").to_i
#     week_of_beginning_of_month = my_data.beginning_of_month.strftime("%U").to_i
#     week_of_target_data - week_of_beginning_of_month + 1
#   end
# end