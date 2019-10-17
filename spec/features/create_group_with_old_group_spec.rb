require 'rails_helper'

RSpec.feature "CreateGroupWithOldGroups", type: :feature do
  include CheckProductOptionSupport

  let(:user) { create(:user) }
  let(:last_group) { Group.last }
  let(:product) { Group.last.products.first}
  let(:option) { Group.last.options.first}

  before do
    create(:group_with_option_and_product, user: user, is_active: false, title: "團團圓圓")
    sign_in user
    visit my_groups_path
  end

  scenario "進到 my 頁面可以看到再開團按鈕" do
    expect(page).to have_content("再開團")
  end

  scenario "按下再開團按鈕進到新增團購頁面" do
    within(".mac.card-group") do
      click_link("再開團")
    end
    expect(page).to have_content("來開團囉")
    expect(page).to have_field('group[title]', with: "團團圓圓")
  end

  scenario "按確定開團會寫進資料庫", js: true, slow: true do
    within('.mac.card-group') do
      click_link("再開團")
    end
    within('.form-pc') do
      click_button("確定開團")
    end

    check_db_title_correct

    check_view_title_correct

    check_db_product_option_correct

    check_view_field_correct
    
  end
end
