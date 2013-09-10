require 'spec_helper'
feature "Creating comments" do
  let!(:user) { Factory(:user) }
  let!(:car) { Factory(:car) }


 before do
   user = factorygirl.create(:user) 
   car = factorygirl.create(:car)
    visit '/'
    click_link project.name
    click_link "new ticket" 
    fill_in "title", with: "add documentation for blink tag"
    fill_in "description", with: "the blink tag has a speed attribute"
    attach_file "file #1", rails.root.join("spec/fixtures/speed.png")
    attach_file "file #2", rails.root.join("spec/fixtures/speed.png")
    attach_file "file #3", rails.root.join("spec/fixtures/speed.png")
    click_button "create ticket"

  end

  
  before do
    define_permission!(user, "view", project)
    sign_in_as!(user)
    visit '/'
    click_link project.name
  end
  scenario "Creating a comment" do
    click_link ticket.title
    fill_in "Text", :with => "Added a comment!"
    click_button "Create Comment"
    page.should have_content("Comment has been created.")
    within("#comments") do
      page.should have_content("Added a comment!")
    end
  end
  scenario "Creating an invalid comment" do
    click_link ticket.title
    click_button "Create Comment"
    page.should have_content("Comment has not been created.")
    page.should have_content("Text can't be blank")
  end
end
