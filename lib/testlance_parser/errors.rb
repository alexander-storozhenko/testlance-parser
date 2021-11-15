module TestlanceParser
  class MemoryLimitError < StandardError
    def initialize(msg = 'Memory usage is over the limit')
      super
    end
  end

  class ScriptSizeLimitError < StandardError
    def initialize(msg = 'Script size is over the limit')
      super
    end
  end

  class LuaInnerFunctionError < StandardError
    def initialize(msg = 'Error while inner function executing')
      super
    end
  end
end
