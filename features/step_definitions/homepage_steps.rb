Given(/^website has following adverts:$/) do |table|
  table.hashes.each do |advert|
    Advert.create(advert)
  end
end

Then(/^I should see following featured adverts:$/) do |table|
  page.should have_css "#featured"
  within("#featured") do
    table.hashes.each do |advert|
      page.should have_content advert["title"]
    end
  end
end

Given(/^website has following location:$/) do |table|
  table.hashes.each do |location|
    Location.create(location)
  end
end

Then(/^I should see following options to choose from location$/) do |table|
  locations = []
  table.hashes.each do |location|
    locations << location[:name]
  end
  page.should have_select "locations"
  page.should have_select "locations", with_options: locations

end