require 'date'
require 'time'

module Testlance
  module Script
    module LuaUtils
      module DateTime
        def date_function
          @lua.function :date_now do
            Time.now.strftime("%y/%m/%d")
          end
        end

        def time_function
          @lua.function :time_now do |time_zone|
            time_zone ? Time.now.strftime("%H:%M:%S%Z") : Time.now.strftime("%H:%M:%S")
          end
        end

        def to_date_function
          @lua.function :to_date do |date_table|
            date = {
              year: Time.now.year,
              month: Time.now.month,
              day: Time.now.day,
            }

            date = date.merge(date_table.to_h)

            "#{date[:year]}/#{date[:month]}/#{date[:day]}"
          end
        end

        def date_compare_function
          @lua.function :compare_dates do |l_value, r_value|
            l_date, r_date = Date.parse(l_value), Date.parse(r_value)

            if l_date > r_date then
              -1
            elsif l_date < r_date then
              1
            else
              0
            end
          rescue => e
            e.msg
          end
        end

        def time_compare_function
          @lua.function :compare_times do |l_value, r_value|
            l_time, r_time = Time.parse(l_value), Time.parse(r_value)

            if l_time > r_time then
              -1
            elsif l_time < r_time then
              1
            else
              0
            end
          rescue => e
            e.msg
          end
        end
      end
    end
  end
end