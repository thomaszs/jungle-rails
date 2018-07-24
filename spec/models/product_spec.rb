require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'product has to be valid' do
      @category = Category.create(name:"Apparel")
      product = Product.new(
        name: "Hoodie",
        price: 1,
        quantity: 1,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end

    it 'name should be valid' do
      @category = Category.create(name: "Apparel")
      name = Product.new(
        name: nil,
        price: 1,
        quantity: 1,
        category_id: @category.id
        )
      expect(name).to_not(be_valid)
    end

    it 'price should be valid' do
      @category = Category.create(name: "Apparel")
      price = Product.new(
        name: "Hoodie",
        price: nil,
        quantity: 15,
        category_id: @category.id
        )
      expect(price).to_not (be_valid)
    end

    it 'quantity should be valid' do
      @category = Category.create(name: "Apparel")
      quantity = Product.new(
        name: "Hoodie",
        price: 1,
        quantity: nil,
        category_id: @category.id
        )
      expect(quantity).to_not (be_valid)
    end

    it 'category should be valid' do
      @category = Category.create(name: "Apparel")
      category_id = Product.new(
        name: "Hoodie",
        price: 1,
        quantity: 1,
        category_id: nil
        )
      expect(category_id).to_not (be_valid)
    end
  end
end