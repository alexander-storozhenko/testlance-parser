# frozen_string_literal: true

RSpec.describe Testlance::Script::Executor do
  let(:data) {
    {
      G_TITLE: 'CUSTOM QUESTION TITLE',
      G_CUSTOM: 'G_CUSTOM',
    }
  }

  let(:lua) { described_class.new(data) }

  context "when successful" do
    it "simple" do
      result = lua.run! read_lua_script 'simple'

      expect(result).to eq 3
    end

    it "date_time" do
      result = lua.run! read_lua_script 'date_time'

      expect(result['date']).to match /\d{2}\/\d{2}\/\d{2}/
      expect(result['time']).to match /\d{2}:\d{2}:\d{2}/
    end

    it "date_time" do
      result = lua.run! read_lua_script 'date_time'

      expect(result['date']).to match /\d{2}\/\d{2}\/\d{2}/
      expect(result['time']).to match /\d{2}:\d{2}:\d{2}/
    end

    it "compare dates" do
      result = lua.run! read_lua_script 'compare_dates'

      expect(result).to eq -1.0
    end

    it "compare times" do
      result = lua.run! read_lua_script 'compare_times'

      expect(result).to eq -1.0
    end
  end

  context "with error" do
    it 'memory usage' do
      expect { lua.run! read_lua_script 'memory_usage' }.to raise_error Testlance::Script::MemoryLimitError
    end

    it 'script size' do
      expect { lua.run! read_lua_script 'big_size_script' }.to raise_error Testlance::Script::ScriptSizeLimitError
    end

    it 'change global constant' do
      expect { lua.run! read_lua_script 'change_constant' }.to raise_error Rufus::Lua::LuaError
    end
  end

  context 'when user code' do
    it 'depends_on_title_points' do
      result = lua.run! read_lua_script 'user_code/depends_on_title_points'
      expect(result).to eq 0.5
    end
  end

  context 'utils' do
    context 'string' do
      it 'split' do
        result = lua.run! read_lua_script 'split_string'
        expect(result.to_h.values).to eq(%w[test string])
      end

      it 'join' do
        result = lua.run! read_lua_script 'join_string'
        expect(result).to eq('test,string')
      end
    end
  end
end