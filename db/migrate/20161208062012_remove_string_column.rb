class RemoveStringColumn < ActiveRecord::Migration
  def change
    change_table :rides do |t|
      t.remove :string
    end
  end
end
