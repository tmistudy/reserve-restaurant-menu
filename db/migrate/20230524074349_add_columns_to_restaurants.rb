class AddColumnsToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :genre, :string
  end
end
