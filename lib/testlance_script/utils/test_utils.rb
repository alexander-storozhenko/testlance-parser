module Testlance
  module Script
    module LuaUtils
      module Test
        def right_answer_function
          @lua.function :right_answer do |answer_number|
            raise LuaInnerFunctionError, 'ANSWERS are empty' if @data[:USER_ANSWERS].empty? || @data[:TRUE_ANSWERS].empty?

            @data[:USER_ANSWERS][:value][answer_number] == @data[:TRUE_ANSWERS][answer_number]
          end
        end
      end
    end
  end
end