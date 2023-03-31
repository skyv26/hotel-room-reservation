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
