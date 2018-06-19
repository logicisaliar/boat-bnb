class Boat < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy
  validates :guests, presence: true
  validates :boat_type, presence: true
  validates :address, presence: true
  validates :price_day, presence: true
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader, presence: true

end
