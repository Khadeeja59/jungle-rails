class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: ENV['USER_NAME'], password: ENV['USER_PASSWORD']
  before_filter :authorize
  def show
    @countProducts = Product.count
    @countCategories = Category.count
  end
end
