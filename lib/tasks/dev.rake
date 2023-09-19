namespace :dev do
    desc "Configure the development enviroment"
    task setup: :environment do
        puts "Registering contacts..."

        100.times do |i|
            # Caso dê erro, o "!" estoura esse erro na tela
            Contact.create!(
                # A gem "Faker" realiza operações de criação de dados fictícios
                name: Faker::Name.name,
                email: Faker::Internet.email,
                birthdate: Faker::Date.between(from: 50.years.ago, to: 18.years.ago)
            )
        end

        puts "Successfully registered contacts!"
    end

end
