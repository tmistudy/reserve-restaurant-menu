class RemoveReservationHourFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :reservation_hour, :integer
    remove_column :reservations, :reservation_min, :integer
    change_column :reservations, :reservation_date, :datetime
  end
end
