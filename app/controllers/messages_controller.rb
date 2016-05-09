class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_conversation

	def index
		# restringiamo l'accesso ai due partecipanti alla conversazione
		if current_user == @conversation.sender || current_user == @conversation.recipient
			@other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
			@messages = @conversation.messages.order("created_at DESC")
		else
			redirect_to conversation_path, alert: "Accesso negato"
		end

		# per ogni conversazione settiamo la prenotazione piu recente che ha come protagonisti i due utenti che conversano
		@reservation = Reservation.where("(user_id = ? AND photographer_id = ?) OR 
											(user_id = ? AND photographer_id = ?)", 
											@conversation.sender.id, @conversation.recipient.id, 
											@conversation.recipient.id, @conversation.sender.id).last
	end

	def create
		@message = @conversation.messages.new(message_params)
		@messages = @conversation.messages.order("created_at DESC")

		if @message.save
			respond_to do |format|
				format.js
			end
		else
			render :index, alert: "Ops! Si è verificato un errore"
		end
	end


	private

	def set_conversation
		@conversation = Conversation.find(params[:conversation_id])
	end

	def message_params
		params.require(:message).permit(:messaggio, :user_id, :read)
	end
end