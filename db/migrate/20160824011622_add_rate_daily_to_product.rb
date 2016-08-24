class AddRateDailyToProduct < ActiveRecord::Migration
  def change
    add_column :products, :rate_daily, :decimal
  end
end
