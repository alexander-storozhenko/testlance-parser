module Testlance
  module Script
    module LuaUtils
      module String
        def string_split_function
          @lua.function :string_split do |string, template|
            raise LuaInnerFunctionError, 'input value must be String' unless string.class == String

            string.split(template)
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