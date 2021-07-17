# frozen_string_literal: true
require 'objspace'

RSpec.describe TestlanceParser::Executor do
  let(:data) {
    {
        title: 'title',
        description: 'description',
        rights: 'public',
    }
  }

  let(:lua) { TestlanceParser::Executor.new(data) }

  context "when successful" do
    it "simple" do
      result = lua.run read_lua_script 'simple'

      expect(result).to eq 3
    end

    it "date_time" do
      result = lua.run read_lua_script 'date_time'

      expect(result['date']).to match /\d{4}-\d{2}-\d{2}/
      expect(result['time']).to match /\d{2}:\d{2}:\d{2}/
    end
  end
end