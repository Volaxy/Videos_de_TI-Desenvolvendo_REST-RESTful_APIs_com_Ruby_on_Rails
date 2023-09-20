namespace :dev do
    desc "Configure the development enviroment"
    task setup: :environment do
        "Reseting DB..."
        %x(rails db:drop:_unsafe db:create db:migrate) # Faz com que comandos sejam executados automaticamente

        # OBS: É importante primeiro criar as classes isoladas e depois referencia-las em outras classes para evitar problemas com referência nula

        ############################################################
        ##### KIND's #####
        puts "Registering contact kinds..."
        
        # O "%w" faz as palavras separadas por " " serem strings
        kinds = %w(Friend Commercial Know)
        kinds.each do |kind|
            Kind.create!(
                description: kind
            )
        end
        
        puts "Successfully registered contacts!\n"
        
        
        
        ############################################################
        ##### CONTACT's #####
        puts "Registering contacts..."
        
        10.times do |i|
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
        
        puts "Successfully registered contacts!\n"
        


        ############################################################
        ##### PHONE's #####
        puts "Registering Phones..."
        
        Contact.all.each do |contact|
            (rand(2) + 1).times do
                phone = Phone.create!(
                    number: Faker::PhoneNumber.phone_number,
                    contact: contact
                )

                contact.phones << phone
                contact.save
            end
        end
        
        puts "Successfully registered Phones!\n"
        

        
        ############################################################
        # OBS.: O Rails permite a criação de mais de um dado associado com o mesmo tipo mesmo estando com "has_only", mas o dado que será anexado ao objeto será o último dado criado
        ##### Address's #####
        puts "Registering Address..."
        
        Contact.all.each do |contact|
            address = Address.create!(
                street: Faker::Address.street_name,
                city: Faker::Address.city,
                contact: contact
            )

            contact.save
        end
        
        puts "Successfully registered Address!\n"
    end

end
