# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ : 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  "name" "description" "location" t.integer "price"


puts 'Cleaning database...'
Booking.destroy_all
User.destroy_all
Skill.destroy_all
Tag.destroy_all


puts 'Creating Users'
user_set = []
user_set << User.create!(first_name: 'Homer', last_name: 'Simpson', email: 'homer@aol.com', password: 'password')
user_set << User.create!(first_name: 'Marge', last_name: 'Simpson', email: 'marge@aol.com', password: 'password')
user_set << User.create!(first_name: 'Bart', last_name: 'Simpson', email: 'bart@aol.com', password: 'password')
user_set << User.create!(first_name: 'Lisa', last_name: 'Simpson', email: 'lisar@aol.com', password: 'password')
user_set << User.create!(first_name: 'Maggie', last_name: 'Simpson', email: 'maggier@aol.com', password: 'password')

puts 'Creating Skills'
skills = [
  "Karate", "Sewing", "Cooking", "Pep-talk", "Light conversation", "Deep Conversation",
  "Unlisenced therapy", "Fashion advice", "Wing-man", "Party-animal","Get-away driver",
  "Rolling ciggies", "Break dancing"
]
skill_set = []
skills.each do |skill|
  skill_set << Skill.create!(name: skill)
end

puts 'Creating Tags'
tags = ["elderly", "fun", "weddings", "bff", "Trend-setter"]
tag_set = []
tags.each do |tag|
  tag_set << Tag.create!(name: tag)
end

puts "Creating Friends"
friend_set = []
10.times do
  friend = Friend.create!(
    name: Faker::TvShows::Friends.character,
    location: Faker::TvShows::Friends.location,
    description: Faker::TvShows::Friends.quote,
    price: rand(100),
    user: user_set.sample
  )
  friend_set << friend
end

# friend_set << Friend.create!(name: "A Mans Best Friend", description: "A loyal labrador who will fetch your paper and follow you around the house", location: "South Yarra", price: "30")
# friend_set << Friend.create!(name: "Betty", description: "Grandma, she will knit you socks and bake you cakes", location: "Lovely Hill", price: "70")
# friend_set << Friend.create!(name: "Marty", description: "The take anywhere friend. Great with parents, life of the party", location: "Heaven", price: "40")

puts "Assigning skills to Friends"
friend_set.each do |friend|
  rand(5).times do
    FriendSkill.create!(friend: friend, skill: skill_set.sample)
  end
end

puts "Assigning tags to Friends"
friend_set.each do |friend|
  rand(5).times do
    FriendTag.create!(friend: friend, tag: tag_set.sample)
  end
end

puts "Creating Bookings"
booking_set = []
friend_set.each do |friend|
  rand(5).times do
    start_time = DateTime.current
    end_time = start_time + rand(21)
    booking = Booking.create!(
      friend: friend,
      user: user_set.sample,
      total_price: (end_time - start_time) / 60 / 60 * friend.price,
      status: 'pending',
      start_time: start_time,
      end_time: end_time,
    )
    booking_set << booking
  end
end

puts 'Creating Reviews'
comments = ["Great Service!", "Very dissapointing", "I want my money back!", "Fine, I guess"]
booking_set.each do |booking|
  if rand > 0.5
    Review.create!(
      content: comments.sample,
      rating: (1..5).to_a.sample,
      booking: booking
      )
  end
end

puts 'Finished!'
