require "open-uri"
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
Friend.destroy_all
User.destroy_all
Skill.destroy_all
Tag.destroy_all


# puts 'Creating Users'
user_set = []
user_set << User.create!(first_name: 'Homer', last_name: 'Simpson', email: 'homer@aol.com', password: 'password', description: '28 years old, Software developer')
user_set << User.create!(first_name: 'Marge', last_name: 'Simpson', email: 'marge@aol.com', password: 'password', description: '85 years old, AFL player')
user_set << User.create!(first_name: 'Bart', last_name: 'Simpson', email: 'bart@aol.com', password: 'password', description: '18 years old, Student')
user_set << User.create!(first_name: 'Lisa', last_name: 'Simpson', email: 'lisa@aol.com', password: 'password', description: '35 years old, Designer')
user_set << User.create!(first_name: 'Maggie', last_name: 'Simpson', email: 'maggie@aol.com', password: 'password', description: '47 years old, Sales manager')


puts 'Creating Skills'
skills = [
  "Karate", "Sewing", "Cooking", "Pep-talk", "Light conversation", "Deep Conversation",
  "Unlisenced therapy", "Fashion advice", "Wing-man", "Party-animal","Get-away driver",
  "Rolling ciggies", "Break dancing", "Boomerang", "Retrieving the paper", "Loyal"
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
# 10.times do
#   friend = Friend.create!(
#     name: Faker::TvShows::Friends.character,
#     location: Faker::Address.city,
#     description: Faker::TvShows::Friends.quote,
#     price: (rand * 100).floor,
#     user: user_set.sample
#     )
#   file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
#   friend.photo.attach(io: file, filename: "#{friend.name}.jpg", content_type: 'image/jpg')
#   friend_set << friend
#   friend.save!
#   puts "added #{friend.name} with photo"
# end

puts "Creating Rex"
  rex = Friend.create!(
    name: "Rex",
    location: "Fawkner Park",
    description: "A loyal labrador who will fetch your paper and follow you around the house",
    price: "30",
    user: user_set.sample
    )
  file = File.open('app/assets/images/lab.jpeg')
  rex.photo.attach(io: file, filename: "#{rex.name}.jpg", content_type: 'image/jpg')
  friend_set << rex
  rex.save!
  puts "added #{rex.name} with photo"

puts "rachel"
 rachel = Friend.create!(
    name: "Rachel Green",
    location: "138 Cubitt St, Cremorne",
    description: "Everyone I know is either getting married or getting pregnant...",
    price: "170",
    user: user_set.sample
    )
  file = File.open('app/assets/images/rachel.jpg')
  rachel.photo.attach(io: file, filename: "rachel.jpg", content_type: 'image/jpg')
  friend_set << rachel
  rachel.save!
  puts "added #{rachel.name} with photo"

puts "Sy"
 sy = Friend.create!(
    name: "Sy Rashid",
    location: "Brunton Ave, Richmond",
    description: "Lets BOOMerang",
    price: "270",
    user: user_set.sample
    )
  file = File.open('app/assets/images/sy.jpeg')
  sy.photo.attach(io: file, filename: "sy.jpeg", content_type: 'image/jpg')
  friend_set << sy
  sy.save!
  puts "added #{sy.name} with photo"

puts "Creating Grandma"
  betty = Friend.create!(
    name: "Betty",
    location: "126 Cubitt St, Cremorne",
    description: "Grandma, she will knit you socks and bake you cakes",
    price: "130",
    user: user_set.sample
    )
  file = File.open('app/assets/images/grandma.jpeg')
  betty.photo.attach(io: file, filename: "#{betty.name}.jpg", content_type: 'image/jpg')
  friend_set << betty
  betty.save!
  puts "added #{betty.name} with photo"


puts "Creating Marty"
  marty = Friend.create!(
    name: "Marty",
    location: "Melbourne",
    description: "The take anywhere friend. Great with parents, life of the party",
    price: "70",
    user: user_set.sample
    )
  file = File.open('app/assets/images/marty.jpeg')
  marty.photo.attach(io: file, filename: "#{marty.name}.jpg", content_type: 'image/jpg')
  friend_set << marty
  marty.save!
  puts "added #{marty.name} with photo"

puts "Ross"
 ross = Friend.create!(
    name: "Ross Geller",
    location: "145 Swan St, Richmond",
    description: "Unagi Is A Total State Of Awareness.",
    price: "170",
    user: user_set.sample
    )
  file = File.open('app/assets/images/ross.jpg')
  ross.photo.attach(io: file, filename: "ross.jpg", content_type: 'image/jpg')
  friend_set << ross
  ross.save!
  puts "added #{ross.name} with photo"

puts "Luke Goodlooking"
  luke = Friend.create!(
    name: "Luke Goodlooking",
    location: "South Yarra",
    description: "Your new hottest accessory",
    price: "570",
    user: user_set.sample
    )
  file = File.open('app/assets/images/model.png')
  luke.photo.attach(io: file, filename: "#{luke.name}.jpg", content_type: 'image/jpg')
  friend_set << luke
  luke.save!
  puts "added #{luke.name} with photo"

puts "Sarah"
  sarah = Friend.create!(
    name: "Sarah",
    location: "South Yarra",
    description: "I give really great advise, always down for a chat",
    price: "70",
    user: user_set.sample
    )
  file = File.open('app/assets/images/sarah.jpeg')
  sarah.photo.attach(io: file, filename: "#{sarah.name}.jpeg", content_type: 'image/jpg')
  friend_set << sarah
  sarah.save!
  puts "added #{sarah.name} with photo"

puts "Joey"
 joey = Friend.create!(
    name: "Joey Tribbiani",
    location: "130 Cubitt St, Cremorne",
    description: "Well, the fridge broke, so I had to eat everything.",
    price: "270",
    user: user_set.sample
    )
  file = File.open('app/assets/images/joey.jpg')
  joey.photo.attach(io: file, filename: "joey.jpg", content_type: 'image/jpg')
  friend_set << joey
  joey.save!
  puts "added #{joey.name} with photo"

# friend_set << Friend.create!(name: "A Mans Best Friend", description: "A loyal labrador who will fetch your paper and follow you around the house", location: "South Yarra", price: "30", user: user_set.sample)
# friend_set << Friend.create!(name: "Betty", description: "Grandma, she will knit you socks and bake you cakes", location: "Lovely Hill", price: "70", user: user_set.sample)
# friend_set << Friend.create!(name: "Marty", description: "The take anywhere friend. Great with parents, life of the party", location: "Heaven", price: "40", user: user_set.sample)

puts "Assigning skills to Friends"

friend_set.each do |friend|
  skill_set.sample((rand * 5).floor).each do |skill|
    FriendSkill.create!(friend: friend, skill: skill)
  end
end
# FriendSkill.create!(friend: ross, skill: Karate)

puts "Assigning tags to Friends"
friend_set.each do |friend|
  tag_set.sample((rand * 5).floor).each do |tag|
    FriendTag.create!(friend: friend, tag: tag)
  end
end

puts "Creating Bookings"
booking_set = []
friend_set.each do |friend|

  rand(5).times do |index|
    start_time = DateTime.current + 1.day + index.week
    end_time = start_time + rand(5).day
    booking = Booking.create!(
      friend: friend,
      user: user_set.sample,
      total_price: (end_time - start_time) / 60 / 60 * friend.price,
      status: 'pending',
      start_time: start_time,
      end_time: end_time
      )
    booking_set << booking
  end
end

puts 'Creating Reviews'
comments = ["Great Service!", "Very dissapointing", "I want my money back!",
 "Fine, I guess", "That guy is legend"," that guy disgraced me", "What a jerk",
  "Sweetest fake friend ever", "poor fella", "childish person", "not worth it", "I cant wait to meet with her again",
  "creepy fella", "10 / 10" ,"Mentally sick" , "call himself drug addict", "dont book ,save your money!!"]
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

