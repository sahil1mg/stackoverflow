# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@stackoverflow.com"
  password = "password"
  User.create!(name:  name,
               email_id: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(created_at: :desc).take(6)

10.times do |tag|
  Tag.create(label: Faker::Lorem.word)
end

users.each { |user|
  10.times do |n|
    title = Faker::Lorem.sentence(1)
    body =  Faker::Lorem.sentence(5)
    question = user.questions.create!(title: title, body: body)
    question.tags << Tag.find(n+1)
  end
}
answerers  = User.order(created_at: :asc).take(4)

answerers.each { |answerer|
  10.times do |n|
    text = Faker::Lorem.sentence(5)
    Answer.create(text:text, user_id:answerer.id, question_id:n)
  end
}
