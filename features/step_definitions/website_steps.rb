When(/^I visit the page "(.*?)"$/) do |arg1|
  visit root_path
end

Then(/^It should work$/) do
  page.should have_text "Kutangaza"
end