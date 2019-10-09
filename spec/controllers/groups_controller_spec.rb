require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "my" do
    before do
      @user = create(:user)
    end

    it "有登入就可以進去" do
      sign_in @user
      get :my
      expect(response).to be_success
    end

    it "沒登入會跳轉登入頁" do
      get :my
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe "edit" do
    before do
      @user = create(:user)
      @group = create(:group, user: @user)
    end

    it "是團主就可以編輯" do
      sign_in @user
      get :edit, params: { id: @group.id}
      expect(response).to be_success
    end

    it "不是團主會跳轉回首頁" do
      other_user = create(:user)
      sign_in other_user
      get :edit, params: { id: @group.id}
      expect(response).to redirect_to '/groups/my?locale=zh-TW'
    end
  end

  # describe "create" do
  #   before do
  #     @user = create(:user)
  #   end

  #   it "登入就可以開團" do
  #     group_params = FactoryBot.attributes_for(:group)
  #     sign_in @user
  #     expect { 
  #       post :create, params: { gruop: group_params }
  #     }.to change(@user.groups, :count).by(1)
  #   end
  # end
end
