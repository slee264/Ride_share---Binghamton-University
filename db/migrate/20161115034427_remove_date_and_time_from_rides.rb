class RemoveDateAndTimeFromRides < ActiveRecord::Migration
  def change
    remove_column :rides, :date, :string
    remove_column :rides, :time, :string
  end
end
