# == Schema Information
#
# Table name: follows
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  group_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe 'validate followed_group_valid' do
    subject { Follow.new(user: user, group: group) }
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    context 'when this follow already exist' do
      let!(:existed_follow) { create(:follow, user: user, group: group) }

      it 'new follow should be unvalid' do
        expect(subject.valid?).to be_falsy
      end
    end

    context 'when this follow not already exist' do
      it 'new follow should be valid' do
        expect(subject.valid?).to be true
      end
    end
  end
end
