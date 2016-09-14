class ProductsController < ApplicationController

before_action :user_signed_in?, :except => [:index, :show]
# user_signed_in? is defined in the application_controller.rb file to be able to use everywhere

  def index
    @products = Product.all.order("created_at DESC")
    @male = Product.where(:gender => 'male').order("created_at DESC")
    @female = Product.where(:gender => 'female').order("created_at DESC")
  end

  def category_index
    # to show the products by category
    # raise 'hell'
    @products = Product.where(:category =>'category_id').order("created_at DESC")
  end

  def index_gender
    # raise 'hell'
    @categories = Category.all.index_by( &:id )
    if params['gender'] == 'men'
      #@products = Product.where(:gender => 'male').order("created_at DESC")
      @products = Product.where(gender: 'male').group_by &:category_id
      @page_title = 'Men'
      render :index_gender_male #to render a view, so the view need to have the name
    elsif  params['gender'] == 'women'
      #@products = Product.where(:gender => 'female').order("created_at DESC")
      @products = Product.where(gender: 'female').group_by &:category_id
      @page_title = 'Women'
      render :index_gender_female #to render a view, so the view need to have the name
    else
      # handle garbage paths
      redirect_to products_path
    end
  end


  def show
    @product = Product.find(params[:id])
    # @male = Product.where(:gender => 'male').order("created_at DESC")
    # @female = Product.where(:gender => 'female').order("created_at DESC")
    # @booking = Booking.new
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
    @product.user_id == @current_user.id
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

  def search
  end

  def search_results
        @products = Product.all.order("created_at DESC")
    #@products = Product.all.order('created_at DESC')
    if params.has_key?('search_keywords')
      #@found_products = Product.keyword_search(params[:search_keywords])
      @found_products = @current_user.products_near( params[:search_keywords] )

      #the method .products_near come from the user.rb the users view, to find the products that are close to the current user
      @search_term = params[:search_keywords] #create this varible to store the name to display for search, check search_results.html.erb
    end

  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :gender, :size, :colour, :description, :photos, :category_id, :rate_daily)
  end




end
