require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
  end

  scenario "Clicking on the image of product opens shows product detail page" do

    visit root_path

    save_screenshot
    # find image of the product and click
    page.find('article', match: :first).find('header a img').click

    save_screenshot

  end

end
