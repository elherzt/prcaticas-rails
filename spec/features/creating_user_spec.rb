require 'spec_helper'
feature "create_user" do
  before do
    visit '/'
    click_link "Sign up"
  end
  scenario "Creating an user" do
    fill_in "user[name]", with: "Alberto"
    fill_in "user[mail]", with: "alberto@tango.com"
    fill_in "user[password]", with: "1234"
    fill_in "user[password_confirmation]", with: "1234"
    click_button "Create User"
    expect(page).to have_content("User has been created.") 
  end
end
