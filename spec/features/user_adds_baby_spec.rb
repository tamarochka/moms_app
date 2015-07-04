require 'rails_helper'

feature 'adds baby', %Q{
  As an authanticated user
  I want add a baby
  So i can relate to him/her in the future actions
} do
  scenario 'user enters valid credentials' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_baby_path

    fill_in 'First name', with: "Masha"
    select Date.today.year, from: "baby_dob_1i"
    select "January", from: "baby_dob_2i"
    select "28", from: "baby_dob_3i"

    click_button 'Add baby'

    expect(page).to have_content('You successfully added Masha')
    expect(Baby.count).to eq(1)
  end

  scenario 'specify invalid credentials' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_baby_path

    click_button 'Add baby'
    expect(page).to have_content("There were problems with your request!")
    expect(page).to have_content("First name can't be blank")
    expect(Baby.count).to_not eq(1)
  end
end
