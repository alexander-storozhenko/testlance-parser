# frozen_string_literal: true

RSpec.describe Testlance::Answer::Parser do
  let(:script) {
    "a = 1
     b = 2
     c = a + b
     return c
    "
  }

  let(:tconfig) { "q: 1; f: #{script};" }

  let(:data) {
    {
        title: 'title',
        description: 'description',
        rights: 'public',
    }
  }

  let(:lua) { TestlanceParser::Executor.new(data) }

  it "perform script" do
    p lua.perform(tconfig)
  end
end
