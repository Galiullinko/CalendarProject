User.create!(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
) if User.where(email: "user@example.com").empty?

3.times do |n|
  Event.find_or_create_by(name: "Event #{n}", start_time: Time.zone.now + n.days)
end
