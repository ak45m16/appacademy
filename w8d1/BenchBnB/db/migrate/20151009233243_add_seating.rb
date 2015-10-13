class AddSeating < ActiveRecord::Migration
  def change
    remove_column :benches, :long
    add_column :benches, :lng, :float
    add_column :benches, :seating, :integer
  end
end
