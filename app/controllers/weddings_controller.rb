class WeddingsController < ApplicationController
	before_action :authenticate_user!

	def create
		@wedding = Wedding.new(address_params)
		@wedding.user_id = current_user.id
		
		if @wedding.save 
			redirect_to root_path
	    else
	      	redirect_to root_path, alert: "Ops! Si è verificato un errore."
	    end
	end

	def update
		@wedding = Wedding.find(params[:id])

		if @wedding.update(address_params)
			redirect_to root_path
	    else
	      	redirect_to root_path, alert: "Ops! Si è verificato un errore."
	    end
	end

	private

	def address_params
		params.require(:wedding).permit(:indirizzo, :data)
	end
end