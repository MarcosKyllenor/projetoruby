puts "Destroying existing records..."
User.destroy_all
Person.destroy_all
Debt.destroy_all

User.create email: 'admin@admin.com', password: '111111'

puts "Usuário criado:"
puts "login admin@admin.com"
puts "111111"

50.times do
    User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6)
    )
  end
  
puts "50 usuários foram criados com sucesso!"

100.times do
    Person.create!(
        name: Faker::Name.name,
        phone_number: Faker::PhoneNumber.phone_number,
        national_id: CPF.generate,
        active: Faker::Boolean.boolean,
        user: User.order('random()').first
      )
  end
puts "100 Pessoas foram cadastradas!"

500.times do
    person = Person.order("RANDOM()").first
      Debt.create!(
        person: person,
        amount: Faker::Number.decimal(l_digits: 2),
        observation: Faker::Lorem.sentence
      )
  end

puts "500 Debitos foram lançados!"