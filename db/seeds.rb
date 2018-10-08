# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sav = User.create!(username: "sav", password: "sav", password_confirmation: "sav", email: "savyounts@gmail.com")
tom = User.create!(username: "tom", password: "tom", password_confirmation: "tom", email: "tom@tom.com")
sam = User.create!(username: "sam", password: "sam", password_confirmation: "sam", email: "sam@sam.com")


Trip.create(name: "Honeymoon", start_date: Faker::Date.forward, user_id: 1, completed: true)
Trip.create(name: "Girls Weekend", start_date: Faker::Date.forward, user_id: 2, completed: false)
Trip.create(name: "Aniversary", start_date: Faker::Date.forward, user_id: 3, completed: true)
Trip.create(name: "Backpacking", start_date: Faker::Date.forward, user_id: 1, completed: false)
Trip.create(name: "Vietnam", start_date: Faker::Date.forward, user_id: 3, completed: false)
Trip.create(name: "Grad Trip", start_date: Faker::Date.forward, user_id: 2, completed: false)
Trip.create(name: "Christmas", start_date: Faker::Date.forward, user_id: 2, completed: false)
Trip.create(name: "Summer Vacay", start_date: Faker::Date.forward, user_id: 1, completed: true)

Destination.create(name: "Piton Mountains", city: "St. Lucia", country: "Virgin Islands", description: "Lush rainforests, majestic mountains and romantic resorts are all reasons to visit this Caribbean island. A haven for honeymooners, St. Lucia offers the perfect mix of seclusion, relaxation and adventure. To take in the spectacular landscape, plan to hike the Piton Mountains or snorkel and scuba dive in the waters of Anse Chastanet." , must_dos: "Go to beach, hike the mountains", creator_id:1)
Destination.create(name: "Grand Tetons", city: "Jackson Hole", country: 'USA', description:"Tucked away less than 60 miles south of Yellowstone National Park, Jackson Hole sees an influx of winter travelers looking to hit the slopes at upscale ski resorts. But you'd be remiss to think that's all there is to do in this small Wyoming town. Visit the neighboring Grand Teton National Park for awe-inspiring vistas, catch a glimpse of majestic animals at the National Elk Refuge or relax sore muscles in the Granite Hot Springs" , must_dos: "Tater Lake" , dont_dos: "don't forget bear spray" , creator_id:2)
Destination.create(name: "Banff", city: "Banff", country: "Canada", description:"This Canadian destination will bring out the explorer in anyone who visits. From hiking and whitewater rafting to skiing and snowboarding, Banff offers travelers an abundance of year-round outdoor activities. The Lake Louise Ski Resort is one of the largest in North America and the striking photo ops of the Canadian Rockies from Moraine Lake can't be underestimated." , must_dos: "ski, snowboard, raft" , dont_dos: "don't swim in the winter" , creator_id:3)
Destination.create(name: "Machu Picchu", city: 'Augas Calientes', country: "Peru", description: 'According to travelers, a visit to this Peruvian UNESCO World Heritage site is a once-in-a-lifetime adventure. Located in the Andes Mountains, the lost city of the Incas features 12 acres of temples, aqueducts and gardens for travelers to discover. Spend a few days acclimating to the altitude in the neighboring city of Cusco, where you can soak up a mix of Incan and Spanish cultures.' , must_dos: 'Wyani picchu hike' , dont_dos: "great cave hike", creator_id:3)
Destination.create(name:'Great Barrier Reef', city:'The Outback', country: 'Austrailia', description: "It's easy to see why the Great Barrier Reef is one of the Seven Natural Wonders of the World – it stretches nearly 1,500 miles along the eastern coastline of Australia and features 3,000 coral reefs, 600 islands and more than 1,600 species of fish. Travelers can see these amazing natural structures from the air or underwater. However, large amounts of coral bleaching (caused by rising ocean temperatures) threaten to destroy this massive marine life habitat, so plan your visit soon to see this awesome sight up close" , must_dos:"pet a kangaroo" , dont_dos: "fight a kangaroo" , creator_id:2)
Destination.create(name: "Deer Valley Restor", city: "Park City", country: "USA", description:"For a luxury ski vacation, look no further than Park City. Popular upscale mountain resorts, specifically Deer Valley and Park City Mountain, provide some of the best ski conditions in the U.S. Even if you're not a powder hound, sites like the Guardsman Pass Scenic Backway and Utah Olympic Park will keep you entertained. For a dose of culture, plan your visit in January, when celebrities descend on the town for the annual Sundance Film Festival" , must_dos:"ski, hike, climb" , dont_dos:"break your leg skiing" , creator_id:1)
Destination.create(name: "San Sebastian", city: "San Sebastian", country: "Spain", description: "You're probably familiar with Spanish hot spots like Madrid and Barcelona, but the northern coastal town of San Sebastian deserves a spot on your bucket list, too. Known for its gorgeous beaches and unique culture, San Sebastian offers a small-town atmosphere influenced by Basque Country. Foodies are also in for a treat as the region is famous for its pintxos – the Basque version of tapas. Explore the city's pintxos bars on your own or with an organized tour group." , must_dos:"go to the beach, drink calimoxo" , dont_dos: "spend all your money on tapas" , creator_id:1)
Destination.create(name: "Phuket", city: "Phuket", country: "Thailand", description: "The largest island in Thailand boasts enough marvels to impress any traveler. You'll find wide sandy beaches, limestone caves and distinctive rock formations. If the scenery doesn't amaze you, then the lavish spas, upscale dining, fine art galleries and swanky hotels just might. Visit during the dry season (November to April) to experience both indoor and outdoor attractions at their best." , must_dos:"Moon party, massages" , dont_dos:"get too drunk at full moon party" , creator_id:2)
Destination.create(name: "Breckenridge", city: "Breckenridge", country: "Colorado", description:"This Colorado town is home to fewer than 5,000 people, but its small size hasn't kept it from becoming one of the best winter sports destinations in America. Travelers love schussing the slopes at local ski resorts in the winter, and hopping in the car for a scenic mountain drive along Boreas Pass Road in the warmer months. Visitors should also explore the quaint Main Street, which is full of boutique shops and restaurants. Plus, its location only 80 miles southwest of Denver makes Breckenridge one of the most accessible skiing and snowboarding spots in Colorado." , must_dos:"Ski all the powder" , dont_dos: "forget your ski jacket" , creator_id:3)
Destination.create(name: "Serengeti National Park", country: "Tanzinia", description: "Serengeti National Park offers an unparalleled experience for travelers. Located in northern Tanzania, the 5,700-square-mile wildlife park is home to The Great Migration – the annual movement of millions of animals in search of food and breeding grounds. Keep your eyes peeled for herds of zebras, gazelles, baboons and spotted hyenas, just to name a few. Increase your chances of catching a glimpse of wildlife by visiting the southern part of the park during the wet season (December to June) or staying along the northern Seregenti during the dry season (July to November). " , must_dos:"African Safari, take pictures of lions, go on jeep tour" , dont_dos:"get eaten by lions" , creator_id:3)


20.times do
  rando_trip_id = rand(1..8)
  rando_destination_id = rand(1..10)
  Plan.create(trip_id: rando_trip_id, destination_id: rando_destination_id)
end

20.times do
  rando_user_id = rand(1..3)
  rando_destination_id = rand(1..10)
  Comment.create(user_id: rando_user_id, destination_id: rando_destination_id, content:Faker::ChuckNorris.fact)
end
