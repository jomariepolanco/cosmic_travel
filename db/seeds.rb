# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Mission.destroy_all
Planet.destroy_all
Scientist.destroy_all

planet_images = [
  "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2003/04/martian_poles_and_cloud_cover/9834222-3-eng-GB/Martian_poles_and_cloud_cover_pillars.jpg",
  "https://www.astrobio.net/images/galleryimages_images/Gallery_Image_10769.jpg",
  "https://solarsystem.nasa.gov/system/resources/detail_files/17845_PIA12567-800w.jpg",
  "https://i.pinimg.com/originals/1e/f8/8a/1ef88a978ba09f0bc336613ab255d86b.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/a/a9/PIA23791-Venus-NewlyProcessedView-20200608.jpg",
  "https://cdn.mos.cms.futurecdn.net/eNTJrysq4A6DqXncBtsRrB-1200-80.jpg",
  "https://space-facts.com/wp-content/uploads/mars.jpg",
  "https://www.popsci.com/resizer/h_Wb0PwWbHG8pyy-57RGJ563bqo=/1034x1034/arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/RZODSOHKA6O4VMNPPUW7GUTUBE.jpg",
  "https://www.popsci.com/resizer/pvibP816CN_tzyv2o9q1V_0kXUI=/1034x715/arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/N3OYC3VMO5GPI2B5WQ733PLNNE.jpg"
]

20.times {Planet.create(name: Faker::TvShows::StarTrek.unique.location,
                        distance_from_earth: Faker::Space.unique.distance_measurement,
                        nearest_star: Faker::Space.star,
                        planet_img: planet_images.sample)}

15.times {Scientist.create(name: Faker::FunnyName.name,
                           field_of_study: Faker::Educator.subject)}

20.times {Mission.create(name: Faker::TvShows::Buffy.unique.episode,
                         scientist_id: Scientist.all.sample.id, 
                         planet_id: Planet.all.sample.id)}