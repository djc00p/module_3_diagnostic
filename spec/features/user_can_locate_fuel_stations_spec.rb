# You will be using this documentation: https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
#
describe "As a user" do
  # When I visit "/"
  visit "/"

end
# And I fill in the search form with 80206 (Note: Use the existing search form)
 fill_in: "search",  with: 80206

# And I click "Locate"
 click_on "Locate"

# Then I should be on page "/search"
 expect(current_path).to eq("/search")

# Then I should see the total results of the stations that match my query, 90.
 expect(total_results).to eq(90)

# Then I should see a list of the 15 closest stations within 5 miles sorted by distance
  within "#15closestsatations" do
    expect(page.all('li').count).to eq(15)
    expect(page).to have_content("5 miles")
  end
# And the stations should be limited to Electric and Propane
# And the stations should only be public, and not private, planned or temporarily unavailable.
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
