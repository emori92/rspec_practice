require 'rails_helper'

# Roll Backを無効化する場合は以下を実行
RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

# transaction: example毎にcommit
RSpec.describe Widget, type: :model do
  describe 'transaction: Commit' do
    it '正常: 4: widgetを追加する => widgetが1つ計上されること' do
      Widget.create(name: :foo)
      expect(Widget.count).to eq 1
    end

    it '正常: 5: 4のexample実行後に、widgetが1で計上されること' do
      expect(Widget.count).to eq 1
    end

    # Delete
    after(:all) { Widget.destroy_all }
  end
end

