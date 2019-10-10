require 'rails_helper'

RSpec.describe User, type: :model do
  context "factoryBbot data" do
    it "做出 user 是有效的" do
      u1 = build(:user)
      expect(u1.valid?).to be true
    end
    it "user 沒有 name 是無效的" do
      u1 = build(:user, :invalid)
      expect(u1.valid?).to be false
    end
  end


end