# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Woa.destroy_all


NB_WOA = 20
# NB_BOOKING = 3
MAX_RATING = 5
MAX_PRICE = 1_000

Faker::Config.locale = "fr"

Woa.destroy_all
NB_WOA.times do |woa_id|

  rent_start_date = Faker::Date.between("2016-11-20", "2017-12-31")

  woa = Woa.create!( title: Faker::Commerce.product_name,
                     description: Faker::Lorem.paragraph(5, true, 20),
                     category: Woa::TYPES.sample,
                     city: Faker::Address.city,
                     latitude: rand(20.00..40.00),
                     longitude: rand(20.00..40.00),
                     price: rand(3..MAX_PRICE/10)*10,
                     deposit: 500 + rand(0..5) *100,
                     rent_start_at: rent_start_date,
                     rent_end_at: Faker::Date.between(rent_start_date, "2017-12-31"),
                     owner_id: rand(User.first.id..User.last.id),
                     size: Woa::SIZES.sample,
                     hooked_on_wall: rand(0..1),
                     needs_power: rand(0..1),
                     needs_wifi: rand(0..1),
                     needs_hygrometry: rand(0..1),
                     needs_temperature: rand(0..1),
                     needs_glass: rand(0..1),
                     needs_alarm: rand(0..1),
                     needs_pedestal: rand(0..1)
                    )
  # byebugrails
  # rand(0..NB_BOOKING).times do |j|
  #   rev = woa.reviews.create!(content: Faker::Lorem.paragraph(1, true, 2),
  #                             rating: rand(0..MAX_RATING),
  #                             restaurant_id: rand(woa_id)
  #                             )

    # Note: plutot que le .create!, on aurait pu faire un:
    # rev = woa.review.create!(...)
    # rev.save
  # end
end

