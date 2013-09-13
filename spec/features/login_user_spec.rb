require 'spec_helper'
feature 'login_user' do
  scenario "Login" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in "signin[name]", with: user.name
    fill_in "signin[password]", with: user.password
    click_button "Sign in"
    expect(page).to have_content("Signed in successfully.")
  end
end
