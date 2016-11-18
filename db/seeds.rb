# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Woa.destroy_all


tab_img = ["http://www.expointhecity.com/wp-content/uploads/2016/07/sculpture-on-the-move-2.jpg",
"http://www.ufunk.net/wp-content/uploads/2016/02/Georg-Scheele-marble-sculpture-1.jpg", "http://cdn.pmnewsnigeria.com/wp-content/uploads/2015/11/White_Sculpture.jpg", "http://www.laboiteverte.fr/wp-content/uploads/2015/11/figurine-sculpture-classique-02.jpg", "http://modock-sculpture-bronze.com/wp-content/uploads/2014/05/sculpture-bronze-femme-corps-nu-profil.jpg", "http://www.ounimam.fr/wp-content/uploads/2013/12/autoportrait-Van-Gogh-825x1024.jpg", "http://www.atypique.co/wp-content/uploads/2011/08/shaka_peinture_art_7.jpg", "http://jmmalard1.free.fr/touareg01.JPG", "http://artwall-and-co.com/759-thickbox_default/tableau-pop-art-zebra-flash.jpg", "http://i2.cdscdn.com/pdt2/6/8/5/1/700x700/gen2009944416685/rw/art-deco-peinture-huile-sur-toile-fait-main.jpg", "https://s-media-cache-ak0.pinimg.com/736x/cd/a1/1b/cda11b9b5071271a9a6d68018c25a847.jpg", "http://mediation.centrepompidou.fr/education/ressources/ENS-mouvement_images/images/xl/05-Jeppe-Hein.jpg", "http://artafrica.fr/7622/statuette-protectrice-chamba.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Statuette_Holoholo-Mus%C3%A9e_ethnologique_de_Berlin.jpg/832px-Statuette_Holoholo-Mus%C3%A9e_ethnologique_de_Berlin.jpg",]

NB_WOA = tab_img.count
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
  woa.photo_url = tab_img[woa_id]


end

