class Place < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :name, :address, :description, presence: true
	validates :name, length: { minimum: 3 }
	geocoded_by :address
	after_validation :geocode
end