require 'rails_helper'

# Roll Backを無効化する場合は以下を実行
RSpec.configure do |c|
  c.use_transactional_examples = true
end

# transaction: example毎にRollback
RSpec.describe Widget, type: :model do
  describe '#create' do
    context 'transaction: Rollback' do
      it '正常: 1: widgetが0で計上されること' do
        expect(Widget.count).to eq 0
      end

      it '正常: 2: widgetを追加する => widgetが1つ計上されること' do
        Widget.create(name: :foo)
        expect(Widget.count).to eq 1
      end

      it '正常: 3: 2のexample実行後に、widgetが0で計上されること' do
        expect(Widget.count).to eq 0
      end

      # Delete
      after(:all) { Widget.destroy_all }
    end
  end
end

