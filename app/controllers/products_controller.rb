class ProductsController < ApplicationController

before_action :user_signed_in?, :except => [:index, :show]
# user_signed_in? is defined in the application_controller.rb file to be able to use everywhere
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    p Rails.application.secrets
  end

  def create
    @product = Product.new (product_params)
    @product.user_id = @current_user.id

    if @product.save
      #We need to add the images here after we save the product.
      params[:photos].each do |photo|
        req = Cloudinary::Uploader.upload(photo) # This is the magic stuff that will let us upload an image to Cloudinary when creating a new product.
        img = Image.create(:url => req["url"])
        @product.images << img
      end

      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :gender, :size, :colour, :description)
  end




end
