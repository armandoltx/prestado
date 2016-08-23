class ProductsController < ApplicationController

before_action :user_signed_in?, :except => [:index, :show]
# user_signed_in? is defined in the application_controller.rb file to be able to use everywhere
  def index
    @products = Product.all
    @male = Product.where :gender => 'male';
    @female = Product.where :gender => 'female';
  end

  def index_gender
    # raise 'hell'
    if params['gender'] == 'men'
      @products = Product.where :gender => 'male';
      @page_title = 'Men'
    elsif  params['gender'] == 'women'
      @products = Product.where :gender => 'female';
      @page_title = 'Women'
    else
      # handle garbage paths
      redirect_to products_path
    end
  end

  def show
    @product = Product.find(params[:id])
    @male = Product.where :gender => 'male';
    @female = Product.where :gender => 'female';
  end

  def new
    @product = Product.new
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
      flash[:message] = 'Product created!'
      redirect_to @product
    else
      flash[:message] = 'There was a problem with your product'
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product.user_id = @current_user.id
  end

  def update
    @product = Product.find(params[:id])
    # raise 'hell'
    if @product.update(product_params)
      params[:photos].present? && params[:photos].each do |photo|
        req = Cloudinary::Uploader.upload(photo) # This is the magic stuff that will let us upload an image to Cloudinary when creating a new product.
        img = Image.create(:url => req["url"])
        @product.images << img
      end
      flash[:message] = 'Product Updated'
      @product.update product_params
        redirect_to @product
    else
      flash[:message] = 'There was a problem with your product'
      render 'edit'
    end
  end


  def destroy
    @product = Product.find(params[:id])
    if @product.is_mine?(@current_user) || @current_user.admin?
      @product.destroy
      redirect_to products_path
    else
      flash[:notice] = 'Admin Access Only'
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :gender, :size, :colour, :description, :photos)
  end




end
