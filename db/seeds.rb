require 'faker'
puts "🌱 Seeding data..."

# Make 50 users
50.times do
  Owner.create(name: Faker::Name.name)
end
rand(1..50).times do
owner = Owner.order('RANDOM()').first
# Make 10 animals
100.times do
    Animal.create(
        image: Faker::LoremFlickr.image(size: "120x150", search_terms: ['animal']),
        name: Faker::Creature::Animal.name,
        age: rand(0..15),
        breed: Faker::Creature::Dog.breed,
        gender: Faker::Creature::Dog.gender,
        owner_id: owner.id
    )
end
end
puts "🌱 Done seeding!"
