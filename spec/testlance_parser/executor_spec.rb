# frozen_string_literal: true
#
RSpec.describe TestlanceParser::Executor do
  let(:script) {
    "
     a = 1
     b = 2
     c = a + b

     return c
    "
  }

  let(:script_result) {3}

  let(:data) {
    {
        title: 'title',
        description: 'description',
        rights: 'public',
    }
  }

  let(:lua) { TestlanceParser::Executor.new(data) }

  context "when successful" do

    it "perform script" do
      res = lua.run(script)

      expect(res).to eq script_result
    end
  end
end