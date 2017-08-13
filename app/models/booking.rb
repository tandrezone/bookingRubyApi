class Booking < ApplicationRecord
	belongs_to :user
	validates_presence_of :name, :date1, :date2, :country, :city, :car
end
