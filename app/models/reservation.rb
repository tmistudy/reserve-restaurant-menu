class Reservation < ApplicationRecord
  belongs_to :restaurant

  validates :reservation_date, presence: true
  validates :menu, presence: true
  validates :people, presence: true
  validates :total, presence: true
end
