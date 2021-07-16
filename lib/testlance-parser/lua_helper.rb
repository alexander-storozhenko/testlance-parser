require 'rufus-lua'

module TestlanceParser
  module LuaHelper
    LUA_SCRIPTS_PATH = 'lib/testlance-parser/lua'.freeze

    def read_lua_script(file)
      File.read("#{LUA_SCRIPTS_PATH}/#{file}.lua")
    end
  end
end