class AddUserToRide < ActiveRecord::Migration
  def change
    add_column :rides, :poster_user_id, :int
  end
end
