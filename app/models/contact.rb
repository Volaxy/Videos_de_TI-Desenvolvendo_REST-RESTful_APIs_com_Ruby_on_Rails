class Contact < ApplicationRecord
    # ASSOCIATIONS
    # Referênciar outro objeto colocando ":" seguido do nome dele
    belongs_to :kind
    has_many :phones # O "has_many" indica que 1 "Contact" tem muitos "Phone"s, no caso a associação "1 para N"
    has_one :address # Indica que uma instância de "Contact" só pode ter dado de "address"

    # Caso seja colocado esse parâmetro, ele vai aceitar inserções de dados através de nesting:
    # params = { contact: {
    #     name: "jack",
    #     email: "jack@gmail",
    #     birthdate: "12/12/2000",
    #     kind_id: 2,
    #     ========================

    # IMPORTANTE: O nome padrão será o atributo seguido por "_attributes"

    #     phones_attributes: [
    #         { number: "1234" },
    #         { number: "3463" },
    #         { number: "2345" }
    #     ]
    #     ========================
    # }}

    # O ":allow_destroy: true" permite apagar um telefone mesmo ele estando nesting
    # Para apagar através do "body" da requisição, é necessário incluir o parâmetro de "id" e de "_destroy" para permitir a exclusão:
    
    # ...
    # "phones_attributes": [
    #     {
    #         "id": 130,
    #         "_destroy": true
    #     }
    # ]
    # ...
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only:true # Indica que quando os dados forem atualizados, o registro do "Address" só será ATUALIZADO, no caso, não se criará outro registro "Address"

    def birthdate_br
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    # Sobrescrita do json que será enviado...
    def as_json(options = {}) # As "options" são os parâmetros enviados para esta função de sobrescrita no momento que a função é invocada no controller
        hash = super(options) # Pega o "Hash" que é criado
        puts hash
        hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)

        hash
    end
end