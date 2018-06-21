# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Run seeding process!"

puts "Destroying all current data"

Booking.delete_all
Boat.delete_all
User.delete_all

puts "Starting seeding process with data..."


EMAIL = %w(joti@design.com jash@fragance.com luli@on.com sebas@gmail.com marcelo@darwin.com)
FIRST_NAME = %w(Joti Jash Luli Sebas Marcelo)
LAST_NAME = %w(Sempe Shah Lucanera Buffo DePolli)
BOAT_TYPE = %w(yatch canoon boat)
NAME = %w(Anastasia Antonus Monterey Victoria Leonardo Acalli Raffielina Isabel )
ADDRESS = [ "Puerto Madero", "Olivos", "Tigre", "Nordelta", "Puerto Madero", "Olivos", "Tigre", "Nordelta", "Puerto Madero", "Olivos"]
DESCRIPTION = [
  "Your perfect match: sun & sea",
  "Perfect boat for a couple!",
  "Super fast and luxury boat",
  "Adorable fishing home",
  "Get a family trip on the sea",
  "Canoon for adventure drivers!",
  "Amazing party cruise",
  "Quite and peaceful yatch",
  "Chill out experience in a noiseless boat"
]

i = 0
t = 0

# Iterate 3 times
3.times do

  # User data
  user_data = {
    email: EMAIL[t],
    password: '12345678',
    first_name: FIRST_NAME[t],
    last_name: LAST_NAME[t]
  }
  # Create User
  user = User.new(user_data)
  user.save

  # We create a Boat
  3.times do
    boat_data = {
      name: NAME[i],
      guests: rand(1..10),
      boat_type: BOAT_TYPE.sample,
      address: ADDRESS[i],
      price_day: rand(100..500),
      description: DESCRIPTION[i],
    }
    boat = Boat.new(boat_data)
    # Asign the boat to a User
    boat.user = user
    boat.save
    boat.remote_photo_url = "http://res.cloudinary.com/dz9qskljz/image/upload/v1529527074/#{i + 1}.jpg"
    boat.save
    i += 1
  end

t += 1

end


puts "Finished seeding process. Seeds Created"
