require 'spec_helper'
feature "Creating comments" do
  before do
    visit '/'
  end

scenario "creating a comment in a car" do
    fill_in "comment[text]", with: "Hola mundo!"
    click_button "Create Comment"
    expect(page).to have_content("Comment has been created.")
 end
end
