class Photographer < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :titolo, presence: true, length: {maximum: 140}
  validates :descrizione, presence: true
  validates :indirizzo, presence: true, length: {maximum: 500}
  validates :imprevisti, presence: true
  validates :tempi_consegna, presence: true, length: {maximum: 500}

end
