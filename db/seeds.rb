# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

2.times do |i|
  user = User.create({
    name: "user-#{i}",
    email: "user-#{i}@mail.com",
    password: "123456",
    password_confirmation: "123456"
  })

  5.times do
    Task.create({
      user_id: user.id,
      title: Faker::Company.bs,
      description: Faker::Company.bs,
      completed_at: [nil, Time.now][Faker::Number.between(from: 0, to: 1)]
    })
  end
end