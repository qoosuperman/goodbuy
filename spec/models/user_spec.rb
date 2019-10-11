require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { build(:user) }
  let(:invalid_user) { build(:user, :invalid) }

  context "factoryBbot data" do
    it "做出 user 是有效的" do
      expect(user1.valid?).to be true
    end
    it "user 沒有 name 是無效的" do
      expect(invalid_user.valid?).to be false
    end
  end


end