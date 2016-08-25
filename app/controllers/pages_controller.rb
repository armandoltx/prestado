class PagesController < ApplicationController
  def home
    @products = Product.all.order("created_at DESC")
  end
end
