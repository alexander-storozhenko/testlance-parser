require 'date'

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
      time_function
      date_function
    end

    def date_function
      @lua.function :G_DATE_NOW do
        Time.now.strftime("%Y-%d-%m")
      end
    end

    def time_function
      @lua.function :G_TIME_NOW do |time_zone|
        time_zone ? Time.now.strftime("%H:%M:%S%Z") : Time.now.strftime("%H:%M:%S")
      end
    end
  end
end