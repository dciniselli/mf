class ReservationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_photographer

	def create
		@reservation = current_user.reservations.create(reservation_params)
		@reservation.photographer_id = @photographer.user.id
		@reservation.tempi_consegna = @photographer.tempi_consegna
		@reservation.num_foto = @photographer.num_foto
		@reservation.durata_video = @photographer.durata_video
		@reservation.imprevisti = @photographer.imprevisti
		@reservation.cancellazione = @photographer.cancellazione
		@reservation.status = "richiesta"
		@reservation.total = (@reservation.foto_cerimonia ? @photographer.foto_cerimonia : 0) + 
								(@reservation.video_cerimonia ? @photographer.video_cerimonia : 0) +
								(@reservation.foto_pre ? @photographer.foto_pre : 0) +
								(@reservation.video_pre ? @photographer.video_pre : 0) +
								(@reservation.foto_post ? @photographer.foto_post : 0) +
								(@reservation.video_post ? @photographer.video_post : 0) +
								(@reservation.prematrimoniale_foto ? @photographer.prematrimoniale_foto : 0) +
								(@reservation.prematrimoniale_video ? @photographer.prematrimoniale_video : 0) +
								(@reservation.trash_dress_foto ? @photographer.trash_dress_foto : 0) +
								(@reservation.trash_dress_video ? @photographer.trash_dress_video : 0) +
								(@reservation.second_camera ? @photographer.second_camera : 0) +
								(@reservation.second_videocamera ? @photographer.second_videocamera : 0) +
								(@reservation.foto_hd ? @photographer.foto_hd : 0) +
								(@reservation.negativi ? @photographer.negativi : 0) +
								(@reservation.trailer_foto ? @photographer.trailer_foto : 0) +
								(@reservation.trailer_video ? @photographer.trailer_video : 0) +
								(@reservation.drone ? @photographer.drone : 0) +
								(@reservation.num_album ? (@reservation.num_album*@photographer.album) : 0) +
								(@reservation.num_mini_album ? (@reservation.num_mini_album*@photographer.album) : 0) +
								(@reservation.num_dvd ? (@reservation.num_dvd*@photographer.album) : 0)

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
			params.require(:reservation).permit(:data, :indirizzo, :status, :foto_cerimonia, :video_cerimonia, :foto_pre, :video_pre, :foto_post, :video_post, 
							:second_camera, :second_videocamera, :foto_hd, :negativi, :trailer_foto, :trailer_video, 
							:drone, :num_album, :num_mini_album, :num_dvd, :trasferta, :prematrimoniale_foto, 
							:prematrimoniale_video, :trash_dress_foto, :trash_dress_video, :offer)
		end

		def set_photographer
	      @photographer = Photographer.find(params[:photographer_id])
	    end
end