require 'date'
require 'time'

module TestlanceParser
  module LuaUtils
    module String
      def string_split_function
        @lua.function :string_split do |string, template|
          string.split(template)
        end
      end
    end
  end
end