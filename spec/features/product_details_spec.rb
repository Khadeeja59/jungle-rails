require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to the product details page", type: :feature, js: true do

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

scenario "They view the product detail page" do
  # ACT
  visit root_path
  
  within first('article.product') do
    find(:css, ".btn.btn-default.pull-right").click
  end
  
  expect(page).to have_css 'article.product-detail'
  save_and_open_screenshot
end
end
