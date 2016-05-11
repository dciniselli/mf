class Photographer < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reservations

  geocoded_by :indirizzo
  after_validation :geocode, if: :indirizzo_changed?

  validates :titolo, presence: true, length: {maximum: 140}
  validates :descrizione, presence: true
  validates :indirizzo, presence: true, length: {maximum: 500}
  validates :imprevisti, presence: true
  validates :tempi_consegna, presence: true, length: {maximum: 500}
  validates :cancellazione, presence: true

end
