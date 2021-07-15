require 'rufus-lua'
require_relative 'configurator'

module TestlanceParser
  class Executor
    def initialize(data)
      @title = data[:title]
      @description = data[:description]
      @rights = data[:rights]
      @q_type = data[:q_type]
      @user_status = data[:user_status]
      @date_time = data[:date_time]

      @lua = Rufus::Lua::State.new
    end

    def perform(tconfig)
      @lua.eval"g_title = '#{@title}'"
      @lua.eval"g_description = '#{@description}'"
      @lua.eval"g_rights = '#{@rights}'"
      @lua.eval"g_q_type = '#{@q_type}'"
      @lua.eval"g_user_status = '#{@user_status}'"
      @lua.eval"g_date_time = '#{@date_time}'"

      script = TestlanceParser::Configurator.new.parse(tconfig)[:script]

      p '1'
      @lua.eval(script)
    rescue => e
      p "Error while parsing: #{e}"
    ensure
      @lua.close
    end
  end
end