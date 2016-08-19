class ProductsController < ApplicationController

  before_action :check_for_user, :except => [:index, :show,]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new (product_params)
    @product.user_id = @current_user.id
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :gender, :size, :colour, :description)
  end




end
