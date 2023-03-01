require 'faker'
puts "🌱 Seeding data..."

# Make 10 users
10.times do
  Owner.create(name: Faker::Name.name)
end
rand(1..5).times do
owner = Owner.order('RANDOM()').first
# Make 10 animals
10.times do
    Animal.create(
        name: Faker::Creature::Animal.name,
        age: rand(0..15),
        breed: Faker::Creature::Dog.breed,
        gender: Faker::Creature::Dog.gender,
        owner_id: owner.id
    )
end
end
puts "🌱 Done seeding!"
