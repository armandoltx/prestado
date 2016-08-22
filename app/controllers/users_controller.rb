class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = @current_user
    #@user = User.find(params[:id])  everybodu can edit
  end

  def update
    @user = @current_user
    if @user.update user_params
      if (params[:file]).present?
        req = Cloudinary::Uploader.upload(params[:file])
        @user.update :image => req["url"]
      end
      redirect_to edit_user_path(@user)
    else
      render:edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation, :image)
  end



end
