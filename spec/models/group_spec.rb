require 'rails_helper'

RSpec.describe Group, type: :model do
  context "factorybot data" do
    it "做出 group 是有效的" do
      g1 = build(:group)
      expect(g1.valid?).to be true
    end

  end


end