require 'rails_helper'
# You will be using this documentation: https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
#
describe "As a user" do
  # When I visit "/"
  it "should see the total results of the stations " do
    visit "/"

    # And I fill in the search form with 80206 (Note: Use the existing search form)
    fill_in "q",  with: 80206

    # And I click "Locate"
    click_on "Locate"

    # Then I should be on page "/search"
    expect(current_path).to eq("/search")
    test = Faraday.new do |builder|
      builder.adapter :test, stubs do |stub|
        stub.get('/ebi') { |env| [ 200, {}, 'shrimp' ]}
      end
    end
    response =

    expect(total_results).to eq(90)
  end
  # # Then I should see a list of the 15 closest stations within 5 miles sorted by distance
  #
  # within "#15closestsatations" do
  #   expect(page.all('li').count).to eq(15)
  #   expect(page).to have_content("5 miles")
  # end
  #
  # # And the stations should be limited to Electric and Propane
  # expect(stations.fuel_types).to eq("Electric and Propane")
  #
  # # And the stations should only be public, and not private, planned or temporarily unavailable.
  # expect(stations.availability).to eq("public")
  #
  # # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  # within ".stations" do
  #   expect(page).to have_content("Name: 1")
  #   expect(page).to have_content("Address: 1")
  #   expect(page).to have_content("Fuel Types: 1")
  #   expect(page).to have_content("Distance: 1")
  #   expect(page).to have_content("Access Times: 1")
  # end
end
