require 'date'

module TestlanceParser
  module LuaInitializer
    def initialize_lua_functions(state)
      @lua = state

      time_function
      date_function
    end

    private

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
