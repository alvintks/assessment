require 'capybara/rspec'
require 'rails_helper'

describe "the signup process", :type => :feature do

  it "signs me up" do
    visit '/users/new'
    within("#users") do
      fill_in 'Name', with: 'alvin'
      fill_in 'Email', with: 'test@testing.com'
      fill_in 'Password', with: 'password'
      fill_in 'Confirmation', with: 'password'
    end
    click_button 'Create my account'
    expect(page).to have_content 'this is the index page'
  end
end

