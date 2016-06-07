class AddressesController < ApplicationController
	before_action :authenticate_user!

	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		
		if @address.save 
			redirect_to root_path
	    else
	      	redirect_to root_path, alert: "Ops! Si è verificato un errore."
	    end
	end

	def update
		@address = Address.find(params[:id])

		if @address.update(address_params)
			redirect_to root_path
	    else
	      	redirect_to root_path, alert: "Ops! Si è verificato un errore."
	    end
	end

	private

	def address_params
		params.require(:address).permit(:indirizzo)
	end
end