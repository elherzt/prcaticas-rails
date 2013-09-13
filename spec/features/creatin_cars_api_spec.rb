require 'spec_helper'

feature "creating a car" do
  before do 
    login
    visit '/'
  end
  let(:url) { "/api/v1/users" }
  it "successful JSON" do
    post "#{url}.json", :user_id => current_user.id,
      :car => {
      :model => "Troca",
      :brand => "Ford",
      :tags => "Troca perrona"
    }
    car = Car.find_by_model!("Troca")
    route = "/api/v1/users/#{car.id}"
    last_response.status.should eql(201)
    last_response.headers["Location"].should eql(route)
    last_response.body.should eql(car.to_json)
  end
end
