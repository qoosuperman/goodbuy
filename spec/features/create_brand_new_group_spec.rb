require 'rails_helper'

RSpec.feature "CreateBrandNewGroups", type: :feature do
  let(:user) { create(:user) }
  let(:last_group) { Group.last }

  before do
    sign_in user
    visit new_group_path
  end

  scenario "可以進到新增團購頁面" do
    expect(page).to have_content("來開團囉")
  end

  scenario "填入基本資訊" do
    within(".form-pc") do
      fill_in("group[title]", with: "團團圓圓")
      click_button("確定開團")
    end

    check_db_title_correct

    check_view_title_correct
  end

  scenario "填入基本資訊加菜單", js: true, slow: true do
    within(".form-pc") do
      fill_in("group[title]", with: "團團圓圓")
      click_on("菜單")
      click_on("新增菜單")
      first('input[placeholder="奶茶"]').set("紅茶")
      first('input[placeholder="50"]').set("20")
      click_button("確定開團")
    end

    check_db_title_correct

    check_view_title_correct
    
    product = last_group.products.first
    expect(product.name).to eq("紅茶")
    expect(product.price).to be(20)
  end

  def check_db_title_correct
    expect(last_group).to be_present
    expect(last_group.title).to eq('團團圓圓') 
  end

  def check_view_title_correct
    visit my_groups_path
    expect(page).to have_content("團團圓圓")
  end
end
