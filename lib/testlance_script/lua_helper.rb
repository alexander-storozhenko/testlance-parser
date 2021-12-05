require 'rufus-lua'

module Testlance
  module Script
    module LuaHelper
      LUA_SCRIPTS_PATH = "#{File.dirname(__FILE__)}/lib/testlance_script/lua".freeze

      def read_lua_script(file)
        [File.read("#{LUA_SCRIPTS_PATH}/#{file}.lua"), "\n"].join
      end
    end
  end
end
