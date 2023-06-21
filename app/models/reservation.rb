class Reservation < ApplicationRecord
  validates :reservation_date, presence: true
  validates :menu, presence: true
  validates :people, presence: true
  validates :total, presence: true
end
