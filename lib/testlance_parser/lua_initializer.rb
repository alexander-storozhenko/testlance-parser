require 'date'
require 'time'

module TestlanceParser
  class LuaInitializer
    CONSTANTS_TABLE = '__constants'.freeze

    def initialize(state, data)
      @lua = state
      @data = data
    end

    def initialize_global_constants
      initialize_constants
      initialize_functions
    end

    private

    def initialize_constants
      constants = @data.map { |var_name, value| "#{var_name} = '#{value}'" }.join(',')
      @lua.eval "#{CONSTANTS_TABLE} = {#{constants}}"
    end

    def initialize_functions
      private_methods.each { |func| send(func) if func.to_s.split('_').last == 'function' }
    end

    def date_function
      @lua.function :g_date_now do
        Time.now.strftime("%y/%m/%d")
      end
    end

    def time_function
      @lua.function :g_time_now do |time_zone|
        time_zone ? Time.now.strftime("%H:%M:%S%Z") : Time.now.strftime("%H:%M:%S")
      end
    end

    def date_compare_helper_function
      @lua.function :compare_dates do |l_value, r_value|
        l_date, r_date = Date.parse(l_value), Date.parse(r_value)

        if l_date > r_date then -1 elsif l_date < r_date then 1 else 0 end
      rescue => e
        e.msg
      end
    end

    def time_compare_helper_function
      @lua.function :compare_times do |l_value, r_value|
        l_time, r_time = Time.parse(l_value), Time.parse(r_value)

        if l_time > r_time then -1 elsif l_time < r_time then 1 else 0 end
      rescue => e
        e.msg
      end
    end
  end
end