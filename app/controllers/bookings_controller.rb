class BookingsController < ApplicationController


  def create
    @booking = Booking.new booking_params
    @booking.user_id = @current_user.id
    @booking.product_id = params[:product_id]

    # raise 'hell'

    @product = Product.find params[:product_id]
    if @booking.save
      flash[:message] = 'Booking successful!'
    else
      flash[:message] = 'There was a problem with your booking' # FIXME
    end
    redirect_to @product
  end

  def update
  end


  private

    def booking_params
      params.require(:booking).permit(:product_id, :start_time, :end_time)
    end


end
