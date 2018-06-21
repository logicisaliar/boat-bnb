require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
      email: "peter.potamus@example.com",
      password: "password",
      first_name: "Peter",
      last_name: "Potamus"
    )
    @user2 = User.create(
      email: "marcelo.polli@example.com",
      password: "password",
      first_name: "Marcelo",
      last_name: "De Polli"
    )
    @boat = Boat.create(
      user_id: @user.id,
      name: "La Serenisima",
      guests: 6,
      boat_type: "yatch",
      address: "Tigre",
      price_day: 362,
      description: "A really nice boat"
    )
    @previous_booking = Booking.create(
      user_id: @user2.id,
      boat_id: @boat.id,
      start_date: Date.new(2018, 6, 22),
      end_date: Date.new(2018, 6, 24)
    )
  end

  test "booking is valid when no overlap exists" do
    new_booking = Booking.new(
      user_id: @user2.id,
      boat_id: @boat.id,
      start_date: Date.new(2018, 7, 22),
      end_date: Date.new(2018, 7, 23)
    )

    assert new_booking.valid?
  end

  test "booking is not valid when overlap exists" do
    new_booking = Booking.new(
      user_id: @user2.id,
      boat_id: @boat.id,
      start_date: Date.new(2018, 6, 21),
      end_date: Date.new(2018, 6, 23)
    )

    refute new_booking.valid?
  end
end
