require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    @user = User.create!(
      first_name: "Some",
      last_name: "Guy",
      email: "nathandrake@uncharted.com",
      password:'1234567',
      password_confirmation:'1234567'
    )
  end


  scenario "User can log in with proper credentials" do
    
    visit '/login'

    fill_in "email", with: 'nathandrake@uncharted.com'
    fill_in "password", with: '1234567'

    #save_screenshot

    page.find('input.btn-danger').click
  
    expect(page).to have_text 'Welcome, nathandrake@uncharted.com'
    #save_screenshot

  end

  scenario "User will be redirected with wrong credentials" do
    
    visit '/login'

    fill_in "email", with: 'gandalf@rivendell.com'
    fill_in "password", with: '7654321'

    save_screenshot

    page.find('input.btn-danger').click
  
    expect(page).to have_link 'Login', href: '/login'
    save_screenshot

  end

end
