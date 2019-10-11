require 'rails_helper'

RSpec.feature "CreateGroupWithPublics", type: :feature do
  before do
    create(:group, :public, title: "Public_Menu")
    user = create(:user)
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

  scenario "按確定開團會寫進資料庫" do
    within('table.table-bordered') do
      click_link("開團")
    end
    within('.form-pc') do
      click_button("確定開團")
    end

    group = Group.last
    expect(group.products.count).to be(2)
    expect(group.options.count).to be(2)
    expect(group.title).to eq("Public_Menu")
  end
end
