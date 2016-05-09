class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		photographer = @photo.photographer

		#per il destroy in real time con ajax
		@photo.destroy
		@photos = Photo.where(photographer_id: photographer.id)
		respond_to :js
	end
end