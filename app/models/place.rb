class Place < ApplicationRecord
	belongs_to :user
	validates :name, :address, :description, presence: true
	validates :name, length: { minimum: 3 }
	geocoded_by :address
	after_validation :geocode
end