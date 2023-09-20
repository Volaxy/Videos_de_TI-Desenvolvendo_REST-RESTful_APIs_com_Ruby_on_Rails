class Contact < ApplicationRecord
    # ASSOCIATIONS
    # Referênciar outro objeto colocando ":" seguido do nome dele
    belongs_to :kind, optional: true
    has_many :phones # o "has_many" indica que 1 "Contact" tem muitos "Phone"s, no caso a associação "1 para N"

    def birthdate_br
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    # Sobrescrita do json que será enviado...
    def as_json(options = {}) # As "options" são os parâmetros enviados para esta função de sobrescrita no momento que a função é invocada no controller
        hash = super(options) # Pega o "Hash" que é criado
        hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)

        hash
    end
end