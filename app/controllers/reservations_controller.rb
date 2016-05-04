class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def create
		@reservation = current_user.reservations.create(reservation_params)

		if @reservation.save 
			redirect_to '/', notice:  "Richiesta inviata!"
	    else
	      	redirect_to photographer_path(@reservation.photographer_id), alert: "Ops! Si è verificato un errore. Per favore inserisci tutte le informazioni richieste!"
	    end
	end

	def show
		@photographer = @reservation.photographer
		@client = @reservation.user_id
	end


	private	    
		def reservation_params
			params.require(:reservation).permit(:photographer_id, :data, :indirizzo, :status, :tempi_consegna, :num_foto, :durata_video, :imprevisti, :cancellazione, :foto_cerimonia, :video_cerimonia, :foto_pre, :video_pre, :foto_post, :video_post, :second_camera, :second_videocamera, :album, :mini_album, :foto_hd, :negativi, :dvd, :trailer_foto, :trailer_video, :drone, :total, :messaggio, :num_album, :num_mini_album, :num_dvd)
		end
end