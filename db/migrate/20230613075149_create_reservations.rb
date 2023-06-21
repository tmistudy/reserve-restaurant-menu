class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.text :menu
      t.integer :total
      t.datetime :reservation_date
      t.integer :people

      t.timestamps
    end
  end
end
