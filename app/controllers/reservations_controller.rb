class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def create
		@reservation = current_user.reservations.create(reservation_params)

		if @reservation.save 
			redirect_to photographer_reservation_path(@reservation.photographer, @reservation), notice:  "Richiesta inviata!"
	    else
	      	redirect_to photographer_path(@reservation.photographer_id), alert: "Ops! Si è verificato un errore. Per favore inserisci tutte le informazioni richieste!"
	    end
	end

	def show
		@reservation = Reservation.find(params[:id])
		@photographer = @reservation.photographer
		@client = @reservation.user
		
		if current_user == @photographer.user || current_user == @client
			@other = current_user == @client ? @photographer.user : @client
		else
			redirect_to '/', alert: "Accesso negato"
		end
	end

	def update
		@reservation = Reservation.find(params[:id])
		@photographer = @reservation.photographer
		@client = @reservation.user

		if current_user == @photographer.user || current_user == @client
			@other = current_user == @client ? @photographer.user : @client
		else
			redirect_to '/', alert: "Accesso negato"
		end

		if @reservation.update(reservation_params)
			redirect_to photographer_reservation_path(@reservation.photographer, @reservation), notice:  "Hai risposto a #{@other.nome}!"
	    else
	      	redirect_to photographer_reservation_path(@reservation.photographer, @reservation), alert: "Ops! Si è verificato un errore."
	    end
	end

	def my_requests
		@requests = current_user.reservations.order("created_at DESC")
	end

	def my_reservations
		@photographer = current_user.photographer
	end


	private	    
		def reservation_params
			params.require(:reservation).permit(:photographer_id, :data, :indirizzo, :status, :tempi_consegna, :num_foto, :durata_video, :imprevisti, :cancellazione, :foto_cerimonia, :video_cerimonia, :foto_pre, :video_pre, :foto_post, :video_post, :second_camera, :second_videocamera, :album, :mini_album, :foto_hd, :negativi, :dvd, :trailer_foto, :trailer_video, :drone, :total, :messaggio, :num_album, :num_mini_album, :num_dvd)
		end
end