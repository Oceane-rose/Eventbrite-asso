class Event < ApplicationRecord
	has_many :attendances
	belongs_to :admin, class_name: "User"
	has_many :users, through: :attendances
	validates :start_date, presence: true
	validate :start_in_the_future
	validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validate :modulo_5
	validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000 }
	validates :location, presence: true

	def start_in_the_future
		if start_date.to_date < DateTime.now.to_date
			errors.add(:start_date, "can't be in the past")
		end
	end

	def modulo_5
		if duration % 5 != 0
			errors.add(:duration, "must be multiple of 5")
		end
	end

end
