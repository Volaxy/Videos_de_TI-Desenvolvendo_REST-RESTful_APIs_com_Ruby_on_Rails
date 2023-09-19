namespace :dev do
    desc "Configure the development enviroment"
    task setup: :environment do
        # OBS: É importante primeiro criar as classes isoladas e depois referencia-las em outras classes para evitar problemas com referência nula

        puts "Registering contact kinds..."
        
        # O "%w" faz as palavras separadas por " " serem strings
        kinds = %w(Friend Commercial Know)
        kinds.each do |kind|
            Kind.create!(
                description: kind
            )
        end
        
        puts "Successfully registered contacts!"



        kind_ids = Kind.pluck(:id)
        puts "Registering contacts..."
        
        50.times do |i|
            # Caso dê erro, o "!" estoura esse erro na tela
            Contact.create!(
                # A gem "Faker" realiza operações de criação de dados fictícios
                name: Faker::Name.name,
                email: Faker::Internet.email,
                birthdate: Faker::Date.between(from: 50.years.ago, to: 18.years.ago),
                # Referencia o objeto "Kind", retorna todos os objetos que existem e cria um novo objeto escolhendo de forma aleatória os "Kind" já existentes
                kind: Kind.all.sample
            )
        end
        
        puts "Successfully registered contacts!"
    end

end
