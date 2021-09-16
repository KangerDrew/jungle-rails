class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def show
    @p_count = Product.count
    @c_count = Category.count
  end
end
