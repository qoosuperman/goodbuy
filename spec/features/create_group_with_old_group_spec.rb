require 'rails_helper'

RSpec.feature "CreateGroupWithOldGroups", type: :feature do
  let(:user) { create(:user) }
  let(:last_group) { Group.last }
  let(:product) { Group.last.products.first}
  let(:option) { Group.last.options.first}

  before do
    create(:group_with_option_and_product, user: user, is_active: false, title: "Old Group")
    sign_in user
    visit my_groups_path
  end

  scenario "進到 my 頁面可以看到再開團按鈕" do
    expect(page).to have_content("再開團")
  end

  scenario "按下再開團按鈕進到新增團購頁面" do
    within("table.table-bordered") do
      click_link("再開團")
    end
    expect(page).to have_content("來開團囉")
    expect(page).to have_field('group[title]', with: "Old Group")
  end

  scenario "按確定開團會寫進資料庫", js: true, slow: true do
    within('table.table-bordered') do
      click_link("再開團")
    end
    within('.form-pc') do
      click_button("確定開團")
    end

    expect(last_group.products.count).to be(1)
    expect(last_group.options.count).to be(1)
    expect(product.name).to eq("紅茶")
    expect(product.price).to be(20)
    expect(option.name).to eq("加椰果")
    expect(option.price).to be(10)
    expect(last_group.title).to eq("Old Group")

    visit edit_group_path(id: last_group.id)
    expect(page).to have_field('group[title]', with: "Old Group")
    click_on("菜單")
    expect(page).to have_field("group[products_attributes][0][name]", with: "紅茶")
    expect(page).to have_field("group[products_attributes][0][price]", with: "20")
    click_on("選項")
    expect(page).to have_field("group[options_attributes][0][name]", with: "加椰果")
    expect(page).to have_field("group[options_attributes][0][price]", with: "10")
  end
end
