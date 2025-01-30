puts "Destroying everything..."

Garden.destroy_all

puts "Everything destroyed!"

garden_names = [
  "French garden",
  "My Cute Balcony",
  "English garden",
  "Flowered patio",
  "Garden in Japan",
  "Walk among flowers"
]

garden_names.each do |garden_name|
  puts "Creating #{garden_name}..."
  garden_request = RestClient.get("https://images.pexels.com/photos/158028/bellingrath-gardens-alabama-landscape-scenic-158028.jpeg")
  garden = Garden.new(
      name: garden_name,
      banner_url: garden_request.request.url
    )
  garden.save!
  3.times do
    plant_request = RestClient.get("https://images.pexels.com/photos/298246/pexels-photo-298246.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
    plant = Plant.new(
      name: Faker::FunnyName.name,
      image_url: plant_request.request.url
    )
    plant.garden = garden
    plant.save!
    sleep(2)
  end
  puts "#{garden_name} created!"
end
