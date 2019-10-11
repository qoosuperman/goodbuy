require 'rails_helper'

RSpec.feature "CreateGroupWithOldGroups", type: :feature do
  let(:user) { create(:user) }

  before do
    create(:group_with_options_and_products, is_public: true, user: user, is_active: false, title: "Old Group")
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

  scenario "按確定開團會寫進資料庫" do
    within('table.table-bordered') do
      click_link("再開團")
    end
    within('.form-pc') do
      click_button("確定開團")
    end

    group = Group.last
    expect(group.products.count).to be(2)
    expect(group.options.count).to be(2)
    expect(group.title).to eq("Old Group")
  end
end
