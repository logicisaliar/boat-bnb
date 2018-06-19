class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# owned boats
  has_many :owned_boats, foreign_key: "user_id", class_name: "Boat"

# booked boats
  has_many :bookings
  has_many :booked_boats, through: :bookings, source: :boat
end
