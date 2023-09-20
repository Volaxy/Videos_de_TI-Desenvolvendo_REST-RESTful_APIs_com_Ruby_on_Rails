class Contact < ApplicationRecord
    # ASSOCIATIONS
    # Referênciar outro objeto colocando ":" seguido do nome dele
    belongs_to :kind, optional: true
    has_many :phones # o "has_many" indica que 1 "Contact" tem muitos "Phone"s, no caso a associação "1 para N"

    def birthdate_br
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    def to_br
        {
            name: self.name,
            email: self.email,
            birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
        }
    end
end