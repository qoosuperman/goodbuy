# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  address     :string
#  phone       :string
#  is_active   :boolean          default(TRUE)
#  start_time  :datetime
#  end_time    :datetime
#  is_public   :boolean          default(FALSE)
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follow_id   :bigint
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group1) { build(:group) }
  let(:order1) { build(:order) }
  let(:order2) { build(:order) }

  describe 'validate title presence' do
    it { should validate_presence_of(:title) }
  end

  describe 'valifate factorybot data' do
    it 'factory group is validate' do
      expect(group1.valid?).to be true
    end
  end

  describe '#total_price' do
    it do
      group1.orders = [order1, order2]
      expect(group1.total_price).to be(order1.total_price + order2.total_price)
    end
  end
end
