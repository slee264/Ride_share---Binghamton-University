class ChangeDateandtimeColumn < ActiveRecord::Migration
  def change
    rename_column :rides, :dateAndTime, :date_and_time
  end
end
