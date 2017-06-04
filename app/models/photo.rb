class Photo < ApplicationRecord
	#attr_accessor :place_id, :caption, :picture
	
	belongs_to :place

	mount_uploader :picture, PictureUploader
end
