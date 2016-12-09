#100.times do |post|
#  Post.create!(date: Date.today, rationale: "#{post} rationale content!")
#end
User.create!(email: "a@a.a", password: "secret", password_confirmation: "secret", first_name: "Ali", last_name: "Baba")

puts "100 posts created and user created"