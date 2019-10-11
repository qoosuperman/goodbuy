require 'rails_helper'

RSpec.feature "CreateGroupWithPublics", type: :feature do
  let(:user) { create(:user) }
  let(:last_group) { Group.last }

  before do
    create(:group_with_option_and_product, is_public: true, title: "Public_Menu")
    sign_in user
    visit public_groups_path
  end

  scenario "進到 public 頁面可以看到公用菜單" do
    expect(page).to have_content("Public_Menu")
  end

  scenario "按開團會進入新增團購頁面" do
    within('table.table-bordered') do
      click_link("開團")
    end
    expect(page).to have_content("來開團囉")
    expect(page).to have_field('group[title]', with: "Public_Menu")
  end

  scenario "按確定開團會寫進資料庫", js: true, slow: true do
    within('table.table-bordered') do
      click_link("開團")
    end
    within('.form-pc') do
      click_button("確定開團")
    end

    expect(last_group.products.count).to be(1)
    expect(last_group.options.count).to be(1)
    expect(last_group.title).to eq("Public_Menu")

    visit edit_group_path(id: last_group.id)
    expect(page).to have_field('group[title]', with: "Public_Menu")
    click_on("菜單")
    expect(page).to have_field("group[products_attributes][0][name]", with: "紅茶")
    expect(page).to have_field("group[products_attributes][0][price]", with: "20")
    click_on("選項")
    expect(page).to have_field("group[options_attributes][0][name]", with: "加椰果")
    expect(page).to have_field("group[options_attributes][0][price]", with: "10")
  end
end
