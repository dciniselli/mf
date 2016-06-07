class Address < ActiveRecord::Base
  belongs_to :user

  geocoded_by :indirizzo
  after_validation :geocode, if: :indirizzo_changed?

  validates :indirizzo, presence: true
end
