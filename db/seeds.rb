# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Person.destroy_all
Debt.destroy_all

User.create email: 'admin@admin.com', password: '111111'

puts "Usuário criado:"
puts "login admin@admin.com"
puts "111111"

1000.times do
    User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6)
    )
  end
  
puts "50 usuários foram criados com sucesso!"

3000.times do
    Person.create!(
        name: Faker::Name.name,
        phone_number: Faker::PhoneNumber.phone_number,
        national_id: CPF.generate,
        active: Faker::Boolean.boolean,
        user: User.order('random()').first
      )
  end
puts "100 Pessoas foram cadastradas!"

15000.times do
    person = Person.order("RANDOM()").first
      Debt.create!(
        person: person,
        amount: Faker::Number.decimal(l_digits: 2),
        observation: Faker::Lorem.sentence
      )
  end

puts "500 Debitos foram lançados!"