Given(/^The player visits the ship placement page$/) do
  visit '/ship_placement'
end

When(/^Player places the ships$/) do
  select('Carrier', :from => 'ships')
end

Then(/^Player should wait for the game to start$/) do
  expect(current_path).to eq('/game')
end
