puts "Data seeding initiated ..."
# Seed data for hotels
Hotel.create(name: "Grand Hotel", address: "123 Main St, Anytown USA")
Hotel.create(name: "Plaza Hotel", address: "456 Central Ave, Anytown USA")
Hotel.create(name: "Hilton Hotel", address: "789 First St, Anytown USA")
Hotel.create(name: "Marriott Hotel", address: "321 Second St, Anytown USA")
Hotel.create(name: "Hyatt Regency", address: "654 Third St, Anytown USA")


# Seed data for rooms
Room.create([
    {description: "Spacious room with a view", price_per_night: 200.00, hotel_id: 1},
    {description: "Luxurious suite with jacuzzi", price_per_night: 500.00, hotel_id: 1},
    {description: "Affordable room for budget travelers", price_per_night: 50.00, hotel_id: 2},
    {description: "Charming room in the heart of the city", price_per_night: 150.00, hotel_id: 2},
    {description: "Family-friendly room with extra beds", price_per_night: 250.00, hotel_id: 2}
])


# Seed data for services
Service.create([
    {name: "Wifi", icon: "wifi.png"},
    {name: "Geyser", icon: "geyser.png"},
    {name: "tv", icon: "tv.png"},
    {name: "air conditionner", icon: "conditionner.png"}
])


# Seed data for rtype
Rtype.create([
    {name: "1BHK"},
    {name: "2BHK"},
    {name: "3BHK"}
])


# Seed data for Room_photos
RoomPhoto.create([
    {photo_path: "https/image1", room_id: 1},
    {photo_path: "https/image2", room_id: 1},
    {photo_path: "https/image3", room_id: 1},
    {photo_path: "https/image4", room_id: 2},
    {photo_path: "https/image5", room_id: 3},
    {photo_path: "https/image6", room_id: 2}
])


# Seed data for Room_services
RoomService.create([
    {room_id: 1, service_id:1},
    {room_id: 1, service_id:2},
    {room_id: 2, service_id:1},
    {room_id: 2, service_id:2},
    {room_id: 3, service_id:1}
])


# Seed data for Room_type
RoomType.create([
    {room_id: 1, rtype_id: 1},
    {room_id: 2, rtype_id: 1},
    {room_id: 3, rtype_id: 2},
    {room_id: 4, rtype_id: 2}
])

puts "Data seeded successfully!!"