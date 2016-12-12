
@user = User.create!(email: "a@a.a", password: "secret", password_confirmation: "secret", first_name: "Ali", last_name: "Baba")

puts "1 user created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content!", user_id: @user.id)
end
puts "100 posts created and user created"