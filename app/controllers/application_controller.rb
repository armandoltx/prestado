class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user

  private

  def user_signed_in?
    # flash[:notice] = 'Please login' unless @current_user
    # redirect_to new_user_session_path unless @current_user
    # Both above and bottom ways do the same thing
    # It is to use in before_action in products_controller.rb,

    flash[:notice] = 'Please login' unless @current_user
    redirect_to new_user_session_path unless @current_user
  end

    def fetch_user
      # Search for a user by their user id if we can find one in the session hash.
        if session[:user_id].present?
          @current_user = User.find_by :id => session[:user_id]

          # Clear out the session user_id if no user is found.
          session[:user_id] = nil unless @current_user
        end
    end

end
