
require 'objspace'
require_relative 'lua_helper'

module TestlanceParser
  class Executor
    include LuaHelper

    SCRIPT_SIZE_LIMIT = 1024.freeze
    MEMORY_USAGE_LIMIT = 100.freeze

    LIBS = %w[math]

    def initialize(data)
      @title = data[:title]
      @description = data[:description]
      @rights = data[:rights]
      @q_type = data[:q_type]
      @user_status = data[:user_status]
      @date_time = data[:date_time]

      @lua = Rufus::Lua::State.new(LIBS)
    end

    def run(lua_script)
      initialize_globals

      safe_run lua_script

    rescue => error
      STDERR.puts "Error while executing: #{error}"
    ensure
      @lua.close
    end

    private

    def safe_run(lua_script)
      script_size = ObjectSpace.memsize_of(lua_script)

      if script_size > SCRIPT_SIZE_LIMIT
        raise 'Script size is over the limit'
      end

      result = @lua.eval(lua_script)

      if @lua.gc_count > MEMORY_USAGE_LIMIT
        raise 'Memory usage is over the limit'
      end

      @lua.gc_collect!

      result
    end

    def initialize_globals
      @lua.eval "g_title = '#{@title}'"
      @lua.eval "g_description = '#{@description}'"
      @lua.eval "g_rights = '#{@rights}'"
      @lua.eval "g_q_type = '#{@q_type}'"
      @lua.eval "g_user_status = '#{@user_status}'"
      @lua.eval "g_date_time = '#{@date_time}'"
    end
  end
end