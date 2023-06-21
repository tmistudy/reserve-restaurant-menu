class AddIntroductionToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :introduction, :text, limit: 50
  end
end
