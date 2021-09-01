
# 10.times do |n|
#   user_name = Faker::Movies::HarryPotter.character
#   email = Faker::Internet.email(name: user_name, domain: 'example')
#   password = "password"
#   User.create!(user_name: user_name,
#                email: email,
#                password: password,
#                )
# end

# 10.times do |n|
#   user_name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email(domain: 'example')
#   password = "password"
#   User.create!(user_name: user_name,
#                email: email,
#                password: password,
#                )
# end

# User.create!(user_name: "moeka", email: "moeka@g.com", password: "111111", password_comfirmation: "111111" )

# 10.times do |n|
#   label_name = Faker::Verb.base
#   Label.create!(label_name: label_name
#                )
#   end

10.times do |n|
  user_name = Faker::Games::Pokemon.name
  email = "ex#{n+1}@ex.com"
  password = "111111"
  admin = false
  User.create!(user_name: user_name,
               email: email,
               password: password,
               )
  end

  10.times do |n|
  task_name = Faker::Food.dish
  to_do = Faker::Food.description
  date = Faker::Date.between(from: Date.today, to: 1.year.from_now)
  status = Faker::Number.between(from: 1, to: 2)
  priority = Faker::Number.between(from: 1, to: 2)
  user_id = Faker::Number.between(from: 0, to: 9)
  Task.create!(task_name: task_name,
               to_do: to_do,
               date: date,
               status: status,
               priority: priority,
               user_id: user_id
               )
  end

  10.times do |n|
  label_name = Faker::Food.ethnic_category
  Label.create!(label_name: label_name
               )
  end

  10.times do |n|
  task_id = Faker::Number.between(from: 0, to: 9)
  label_ids = [ Faker::Number.between(from: 0, to: 9), Faker::Number.between(from: 0, to: 9)]
  Label.create!(task_id: task_id,
                label_ids: label_ids
               )
  end  