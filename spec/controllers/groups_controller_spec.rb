require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "my" do
    before do
      @user = create(:user)
    end

    it "有登入就可以進去" do
      sign_in @user
      get :my
      expect(response).to be_successful
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
      expect(response).to be_successful
    end

    it "不是團主會跳轉回首頁" do
      other_user = create(:user)
      sign_in other_user
      get :edit, params: { id: @group.id}
      expect(response).to redirect_to '/groups/my?locale=zh-TW'
    end
  end

  describe "create" do
    before do
      @user = create(:user)
    end

    it "登入就可以開團" do
      #這邊為了不讓資料名字跟 controller 打架使用 spec_group_params
      spec_group_params = FactoryBot.attributes_for(:group)
      sign_in @user
      expect { 
        post :create, params: { group: spec_group_params }
      }.to change(@user.groups, :count).by(1)
    end
  end

  describe "update" do
    context "團主" do
      before do
        @user = create(:user)
        @group = create(:group, user: @user)
      end

      it "可以更新資訊" do
        spec_group_params = FactoryBot.attributes_for(:group, title: "New Group")
        sign_in @user
        patch :update, params: { id: @group.id, group: spec_group_params }
        expect(@group.reload.title).to eq("New Group")
      end
    end
    context "登入但非團主" do
      before do
        @user = create(:user)
        other_user = create(:user)
        @group = create(:group, user: other_user, title: "Old Group")
      end

      it "無法更新資訊" do
        spec_group_params = FactoryBot.attributes_for(:group, title: "New Group")
        sign_in @user
        patch :update, params: { id: @group.id, group: spec_group_params }
        expect(@group.reload.title).to eq("Old Group")
      end

      it "被導回首頁" do
        spec_group_params = FactoryBot.attributes_for(:group, title: "New Group")
        sign_in @user
        patch :update, params: { id: @group.id, group: spec_group_params }
        expect(response).to redirect_to my_groups_path
      end
    end
    context "未登入" do
      before do
        other_user = create(:user)
        @group = create(:group, user: other_user)
      end

      it "被導回首頁" do
        spec_group_params = FactoryBot.attributes_for(:group)
        patch :update, params: { id: @group.id, group: spec_group_params }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe "close" do
    context "團主" do
      before do
        @user = create(:user)
        @group = create(:group, user: @user)
      end

      it "可以結單" do
        sign_in @user
        put :close, params: { id: @group.id }
        expect(@group.reload.is_active).to be false
      end
    end
    context "登入但非團主" do
      before do
        @user = create(:user)
        other_user = create(:user)
        @group = create(:group, user: other_user)
      end

      it "無法結單" do
        sign_in @user
        put :close, params: { id: @group.id }
        expect(@group.reload.is_active).to be true
      end

      it "被導回首頁" do
        sign_in @user
        put :close, params: { id: @group.id }
        expect(response).to redirect_to my_groups_path
      end
    end
    context "未登入" do
      before do
        other_user = create(:user)
        @group = create(:group, user: other_user)
      end

      it "被導回首頁" do
        put :close, params: { id: @group.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

end
