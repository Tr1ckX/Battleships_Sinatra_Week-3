Given(/^I visit the homepage$/) do
  visit '/'
end

When(/^I fill in my name$/) do
  fill_in('player_name', :with => 'John')
end

When(/^I click on register$/) do
  click_button('Register')
end

Then(/^I should be passed to the ship placement page$/) do
  expect(current_path).to eq('/game')
end

Then(/^see a greeting message with the player's name\.$/) do
  expect(page).to have_content('Welcome John')
end
