require 'objspace'
require 'rufus-lua'
require_relative 'lua_initializer'

module TestlanceParser
  class Executor
    include LuaInitializer

    attr_reader :data

    SCRIPT_SIZE_LIMIT = 1024.freeze
    SCRIPT_CLEAR_SIZE_LIMIT = 512.freeze
    MEMORY_USAGE_LIMIT = 100.freeze

    LIBS = %w[math].freeze

    def initialize(data = {})
      @data = data
      @lua = Rufus::Lua::State.new(LIBS)

      initialize_global_variables
      initialize_global_functions
    end

    def reload(data = nil)
      @data = data if data
      @lua = Rufus::Lua::State.new(LIBS)

      self
    end

    def run(lua_script)
      safe_run! lua_script

    rescue => error
      STDERR.puts "Error while executing: #{error}"
    end

    private

    def safe_run!(lua_script)
      script_size = lua_script.length
      script_clear_size = lua_script.gsub(/\s/, '').length

      if script_size > SCRIPT_SIZE_LIMIT || script_clear_size > SCRIPT_CLEAR_SIZE_LIMIT
        raise 'Script size is over the limit'
      end

      result = @lua.eval(lua_script)

      if @lua.gc_count > MEMORY_USAGE_LIMIT
        raise 'Memory usage is over the limit'
      end

      @lua.gc_collect!

      result
    end

    def initialize_global_variables
      @data.each { |var_name, value| @lua.eval("#{var_name} = '#{value}'") }
    end

    def initialize_global_functions
      initialize_lua_functions @lua
    end
  end
end