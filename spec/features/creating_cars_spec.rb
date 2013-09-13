require 'spec_helper'
feature 'Creating cars' do
  before do
    login
    click_link "view"
    click_link "Add car"
  end

scenario "Creating a car with a picture" do
  fill_in "car[model]", with: "Tsuru 2002"
  fill_in "car[brand]", with: "Nissan"
  attach_file "File #1", Rails.root.join("spec/fixtures/Crystal_Project_demo.png")
  attach_file "File #2", Rails.root.join("spec/fixtures/Crystal_Project_demo.png")
  attach_file "File #3", Rails.root.join("spec/fixtures/Crystal_Project_demo.png")
  click_button "Create Car"
  expect(page).to have_content("car added")
  end
end
