require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  let(:user) { create(:user) }
  before do
    visit user_session_path
  end

  scenario "user signin success with valid info" do
    fill_in "user[email]", with: user.email
    fill_password_and_log_in 

    expect(page).to have_content "開團紀錄"
  end
  scenario "user signin success with no email" do
    fill_password_and_log_in 

    expect(page).to have_content "登入"
  end

  private
  def fill_password_and_log_in 
    fill_in "user[password]", with: user.password
    click_button "登入"
  end
end
