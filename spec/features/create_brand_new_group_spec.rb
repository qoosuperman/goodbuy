require 'rails_helper'

RSpec.feature "CreateBrandNewGroups", type: :feature do
  include CheckProductOptionSupport

  let(:user) { create(:user) }
  let(:last_group) { Group.last }
  let(:product) { Group.last.products.first}
  let(:option) { Group.last.options.first}

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

  scenario "填入基本資訊加菜單選項", js: true, slow: true do
    within(".form-pc") do
      fill_in("group[title]", with: "團團圓圓")
      click_on("菜單")
      click_on("新增菜單")
      first('input[placeholder="奶茶"]').set("紅茶")
      first('input[placeholder="50"]').set("20")
      click_on("選項")
      click_on("新增選項")
      first('input[placeholder="加珍珠"]').set("加椰果")
      first('input[placeholder="10"]').set("10")
      click_button("確定開團")
    end

    check_db_title_correct

    check_view_title_correct

    check_db_product_option_correct

    check_view_field_correct
  end


end
