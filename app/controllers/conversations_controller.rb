class ConversationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@conversations = Conversation.involving(current_user).order("created_at DESC")
		
		# per ogni conversazione settiamo la prenotazione piu recente che ha come protagonisti i due utenti che conversano
		@conversations.each do |conversation|
			@reservation = Reservation.where("(user_id = ? AND photographer_id = ?) OR 
											(user_id = ? AND photographer_id = ?)", 
											conversation.sender.id, conversation.recipient.id, 
											conversation.recipient.id, conversation.sender.id).last
		end
	end

	def create
		# se la conversazione esiste gia'usiamo quella, se no la creiamo
		if Conversation.between(params[:sender_id], params[:recipient_id]).present?
			@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
		else
			@conversation = Conversation.create(conversation_params)
		end

		redirect_to conversation_messages_path(@conversation)
	end

	private

	def conversation_params
		params.permit(:sender_id,:recipient_id)
	end

end