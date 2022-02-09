require 'rails_helper'

require 'rails_helper'

RSpec.feature "Visitor navigates to home page and then to add to cart page", type: :feature, js: true do

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

  scenario "They see the cart" do
    # ACT
    visit root_path
   
    within first('article.product') do
      find("button.btn.btn-primary").click
    end

  expect(page).to have_content 'My Cart (1)'
  save_and_open_screenshot

  end
end
