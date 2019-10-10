require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  scenario "user signin success with valid info" do
    user = create(:user)

    visit user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "登入"

    expect(page).to have_content "我的團購"
  end
  scenario "user signin success with no email" do
    user = create(:user)

    visit user_session_path
    fill_in "user[password]", with: user.password
    click_button "登入"

    expect(page).to have_content "登入"
  end
end
