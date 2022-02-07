require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "with attributes name, price, quantity and category" do
      @category = Category.new(:name => "Kitchenware")
      @product = Product.new(:name => "Pan", :price => 100, :quantity=>10, :category => @category)
      expect(@product).to be_valid
    end  
    it "with missing name attribute" do
      @category = Category.new(:name => "Kitchenware") 
      @product = Product.new(:name => nil, :price => 100, :quantity=>10, :category => @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "with missing price attribute" do
      @category = Category.new(:name => "Kitchenware") 
      @product = Product.new(:name => "Pan", :price => nil, :quantity=>10, :category => @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "with missing quantity attribute" do
      @category = Category.new(:name => "Kitchenware") 
      @product = Product.new(:name => "Pan", :price => 100, :quantity=>nil, :category => @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "with missing category attribute" do
      @product = Product.new(:name => "Pan", :price => 100, :quantity=>10, :category => nil)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end