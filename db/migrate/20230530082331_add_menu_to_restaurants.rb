class AddMenuToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :menu, :text
  end
end
