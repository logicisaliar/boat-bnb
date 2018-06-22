class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :start_date, inclusion: { in: (Date.today..Date.today+5.years) }
  validate :end_date_must_be_after_start_date
  validate :boat_must_be_available

  scope :overlapping_with, ->(booking) do
    where.not("end_date <= :start_date OR start_date >= :end_date", start_date: booking.start_date, end_date: booking.end_date)
  end

  private

  def boat_must_be_available
    overlapping_bookings = self.boat.bookings.overlapping_with(self)
    if overlapping_bookings.any?
      errors.add(:base, "Please select other dates")
    end
  end

    def end_date_must_be_after_start_date
      return if end_date.blank? || start_date.blank?

      if end_date <= start_date
        errors.add(:end_date, "cannot be before the start date")
      end
    end
  end
