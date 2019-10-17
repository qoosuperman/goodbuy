require 'rails_helper'

RSpec.feature "CreateGroupWithPublics", type: :feature do
  include CheckProductOptionSupport
  let(:user) { create(:user) }
  let(:last_group) { Group.last }
  let(:product) { Group.last.products.first}
  let(:option) { Group.last.options.first}

  before do
    create(:group_with_option_and_product, is_public: true, title: "團團圓圓")
    sign_in user
    visit public_groups_path
  end

  scenario "進到 public 頁面可以看到公用菜單" do
    expect(page).to have_content("團團圓圓")
  end

  scenario "按開團會進入新增團購頁面" do
    within('.mac.card-group') do
      click_link("開團")
    end
    expect(page).to have_content("來開團囉")
    expect(page).to have_field('group[title]', with: "團團圓圓")
  end

  scenario "按確定開團會寫進資料庫", js: true, slow: true do
    within('.mac.card-group') do
      click_link("開團")
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
