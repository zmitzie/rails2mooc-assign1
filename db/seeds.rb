# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username:  "Example User",
    
             password_digest:              "foobar")

99.times do |n|
  username  = Faker::Name.name
  
  password_digest = "password"
  User.create!(username:  username,
               
               password_digest: password_digest,)
end