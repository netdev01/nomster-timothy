class PhotosController < ApplicationController

	def create
		@place = Place.find(params[:place_id])
		@place.photos.create(photo_params)
		redirect_to place_path(@place)
	end

	def destroy
		@place = Place.find(params[:place_id])
		if @place.user != current_user
			return render text: 'Not Allowed', status: :forbidden
		end
		@id = params[:id]
		@photo = Photo.find(@id)
		@photo.destroy if @place == @photo.place
		redirect_to place_path(@place)
	end

	private

	def photo_params
		params.require(:photo).permit(:picture, :caption)
	end

end
