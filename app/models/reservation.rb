class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :photographer

  validates :data, presence: true
  validates :indirizzo, presence: true

  enum status: { 
		richiesta: 0, 
		approvata: 1, 
		offerta: 2,
		rifiutata: 3,
		cancellata: 4,
		da_pagare: 5,
		completata: 6,
		scaduta: 7
		}
end
