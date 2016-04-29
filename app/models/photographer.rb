class Photographer < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :titolo, presence: true, length: {maximum: 140}
  validates :descrizione, presence: true
  validates :indirizzo, presence: true, length: {maximum: 500}
  validates :imprevisti, presence: true
  validates :tempi_consegna, presence: true
  validates :foto_cerimonia, numericality: true
  validates :video_cerimonia, numericality: true
  validates :foto_pre, numericality: true
  validates :video_pre, numericality: true
  validates :foto_post, numericality: true
  validates :video_post, numericality: true
  validates :second_camera, numericality: true
  validates :second_videocamera, numericality: true
  validates :album, numericality: true
  validates :mini_album, numericality: true
  validates :foto_hd, numericality: true
  validates :negativi, numericality: true
  validates :dvd, numericality: true
  validates :trailer_foto, numericality: true
  validates :trailer_video, numericality: true
  validates :drone, numericality: true

end
