# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rate_daily :decimal(, )
#

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :start_time, :presence => true
  validates :end_time, :presence => true

  def booking_days
    (end_time - start_time) / 1.day
  end

  def total_price
    if not product.rate_daily.blank?
      product.rate_daily * booking_days
    else
      0.0
    end
  end

end
