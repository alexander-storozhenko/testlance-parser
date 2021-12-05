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
        @lua.eval @data.map { |var_name, data| with_type(data[:type], data[:value], var_name) }.join("\n")
      end

      def with_type(type, value, var_name)
        case type
        when :table
          "#{var_name} = {}\n#{value.map { |k, v| "#{var_name}[#{k}] = #{v}" }.join("\n")}"
        when :array
          "#{var_name} = {#{value.join(',')}}"
        else
          "#{var_name} = '#{value}'"
        end
      end

      def initialize_functions
        public_methods.each { |func| send(func) if func.to_s.split('_').last == 'function' }
      end
    end
  end
end