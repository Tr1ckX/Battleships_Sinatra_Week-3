Given(/^I visit the ship placement page$/) do
  visit '/ship_placement'
end

When(/^Player places the ships$/) do
  fill_in 'ship_one', with: 'a1'
  select('vertical', :from => 'ship_one_orintation')
end

Then(/^Player should wait for the game to start$/) do
  pending # express the regexp above with the code you wish you had
end
