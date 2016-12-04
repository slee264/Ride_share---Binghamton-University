class AddDatetimeToRides < ActiveRecord::Migration
  def change
    add_column :rides, :dateAndTime, :datetime
  end
end
