class AddRateDailyToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :rate_daily, :decimal
  end
end
