require 'rails_helper'

RSpec.feature "Visitor add items to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
        name: "Hat",
        description: "A cool hat",
        quantity: 5,
        price: 10
      )
    end

  scenario "Click add and the cart number increase count by one" do
    # ACT
    visit root_path
    
    click_link(text: "Add", match: :first)
    # DEBUG
    
    #VERIFY
    expect(page).to have_content('My Cart (1)')
    # sleep (5)
    save_screenshot
  end
end