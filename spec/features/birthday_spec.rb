require 'date'

feature 'Birthday' do
  scenario 'dosent have birthday message' do
    birthday = Birthday.new('Donald', '26November')
    visit('/')
    fill_in :name, with: 'Donald'
    fill_in :day, with: '26'
    select('November', from: :birthday_month)
    click_button 'Submit'
    expect(page).to have_content "Your Birthday will be in #{birthday.days_left} days, Donald."
  end

  scenario 'has birthday message' do
    month = Time.now.strftime "%B"
    day_month = month + Time.new.day.to_s
    birthday = Birthday.new('Donald', day_month)
    visit('/')
    fill_in :name, with: 'Donald'
    fill_in :day, with: Time.new.day
    select(month, from: :birthday_month)
    click_button 'Submit'
    expect(page).to have_content "Happy Birthday #{birthday.name}!"
  end
end