require 'rails_helper'

RSpec.describe Order, type: :model do
  context "factorybot data" do
    it "做出 order 是有效的" do
      o1 = build(:order)
      expect(o1.valid?).to be true
    end
  end


end