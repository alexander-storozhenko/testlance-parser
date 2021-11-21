module Testlance
  module Script
    module LuaUtils
      module String
        def string_split_function
          @lua.function :string_split do |string, template|
            raise LuaInnerFunctionError, 'input value can not be converted to String' unless string.respond_to?(:to_s)

            string.split(template.to_s)
          end
        end

        def string_join_function
          @lua.function :string_join do |table, join_string|
            raise LuaInnerFunctionError, 'input value must be Table' unless table.class == Rufus::Lua::Table

            table.to_h.values.join(join_string)
          end
        end
      end
    end
  end
end