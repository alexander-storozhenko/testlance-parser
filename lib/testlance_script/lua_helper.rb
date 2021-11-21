require 'rufus-lua'

module Testlance
  module Script
    module LuaHelper
      LUA_SCRIPTS_PATH = 'lib/testlance_parser/lua'.freeze

      def read_lua_script(file)
        [File.read("#{LUA_SCRIPTS_PATH}/#{file}.lua"), "\n"].join
      end
    end
  end
end
