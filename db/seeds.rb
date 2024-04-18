# seeds.rb

puts "Creating users..."
100.times do |n|
  user = User.create!(
    email: "user#{n + 1}@example.com",
    password: "password"
  )
  puts "User #{user.id} created successfully!"
end
puts "Users created successfully!"

puts "Creating topics..."
20.times do |n|
  user = User.all.sample
  topic = Topic.create!(
    title: "Topic #{n + 1}",
    description: "Description for Topic #{n + 1}",
    creator: user
  )
  puts "Topic #{topic.id} created successfully!"
end
puts "Topics created successfully!"

puts "Associating users with topics..."
Topic.all.each do |topic|
  subscribers = User.all.sample(10)
  topic.subscribers << subscribers
  puts "Subscribers associated with topic #{topic.id} successfully!"
end
puts "Subscribers associated with topics successfully!"

puts "Assigning admins..."
Topic.all.each do |topic|
  subscribers = topic.subscribers
  admins = subscribers.sample(5)
  topic.admins << admins
  puts "Admins assigned for topic #{topic.id} successfully!"
end
puts "Admins assigned successfully!"

puts "Creating messages..."
Topic.all.each do |topic|
  50.times do |n|
    user = topic.subscribers.sample
    message = topic.messages.create!(
      content: "Message #{n + 1} on #{topic.title}",
      user: user
    )
    puts "Message #{message.id} created successfully!"
  end
end
puts "Messages created successfully!"
