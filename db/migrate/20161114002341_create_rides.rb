class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :departure_location
      t.string :string
      t.string :destination_location
      t.string :string
      t.string :date
      t.string :date
      t.string :time
      t.string :time

      t.timestamps null: false
    end
  end
end
