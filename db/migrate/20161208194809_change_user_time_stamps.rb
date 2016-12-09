class ChangeUserTimeStamps < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :created_at, :updated_at
      add_column(:users, :created_at, :datetime)
      add_column(:users, :updated_at, :datetime)
    end
  end
end
