class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :start_date, inclusion: { in: (Date.today..Date.today+5.years) }
  validate :end_date_must_be_after_start_date
  validate :boat_must_be_available

  private

  def boat_must_be_available
    counter = 0
    occupied = self.boat.bookings
    occupied.sort_by {|x| x.start_date}
    last_booking_index = occupied.length - 1
    if last_booking_index < 0
      counter = 1
    else
      occupied.each_with_index do |booking, index|
        if index == 0 && (end_date <= booking.start_date)
          counter = 1
          break
          if index == last_booking_index && (booking.end_date <= start_date)
            counter = index
            break
          else (end_date <= booking.start_date) && (booking.end_date <= start_date)
            counter = index
            break
          end
        end
        errors.add(:base, "Please select other dates") if counter == 0
      end
    end
  end

    def end_date_must_be_after_start_date
      return if end_date.blank? || start_date.blank?

      if end_date <= start_date
        errors.add(:end_date, "cannot be before the start date")
      end
    end
  end
