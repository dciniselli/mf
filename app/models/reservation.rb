class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :photographer

  validates :data, presence: true
  validates :indirizzo, presence: true
end
