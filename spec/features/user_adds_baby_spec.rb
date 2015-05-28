require 'rails_helper'

feature 'adds baby', %Q{
  As an authanticated user
  I want add a baby
  So i can relate to him/her in the future actions
} do
  scenario 'user enters valid credentials' do
    user = FactoryGirl.create(:user)

    visit new_baby_path

    fill_in 'Name', with: "Masha"
    fill_in 'Age', with: 1

    click_button 'Add baby'

    expect(page).to have_content('You successfully added Masha')
    expect(Baby.count).to eq(1)
  end

  scenario 'specify invalid credentials' do
    visit new_baby_path

    click_button 'Add baby'
    expect(page).to have_content("Please provide baby's firt name")
    expect(page).to have_content("Please provide baby's age")
    expect(Baby.count).to_not eq(1)
  end
end
