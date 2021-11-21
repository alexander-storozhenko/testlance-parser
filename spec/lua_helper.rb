require 'rufus-lua'

module LuaHelper
  LUA_SCRIPTS_PATH = 'spec/testlance_script/lua_scripts/'.freeze

  def read_lua_script(file)
    [File.read("#{LUA_SCRIPTS_PATH}/#{file}.lua"), "\n"].join
  end
end
