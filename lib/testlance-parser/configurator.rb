module TestlanceParser
  class Configurator
    attr_reader :q_id
    attr_reader :script

    def parse(tconfig)
      splitted = key_value(tconfig)
      @q_id = splitted['q']
      @script = splitted['f']
    end

    private

    def key_value(tconfig)
      tconfig.split(';').map do |v|
        res = v.split(':')
        {"#{res[0].strip}" => res[1] }
      end
    end
  end
end