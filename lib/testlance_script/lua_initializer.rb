require_relative 'utils/date_time_utils'
require_relative 'utils/string_utils'

module Testlance
  module Script
    class LuaInitializer
      include LuaUtils::DateTime
      include LuaUtils::String

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
        @lua.eval @data.map { |var_name, data| "#{var_name} = #{with_type(data[:type], data[:value])}" }.join("\n")
      end

      def with_type(type, value)
        case type
        when :table
          "{#{value.map { |k, v| "#{k} = #{v}" }.join(',')}}"
        else
          "'#{value}'"
        end
      end

      def initialize_functions
        public_methods.each { |func| send(func) if func.to_s.split('_').last == 'function' }
      end
    end
  end
end