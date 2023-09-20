class Contact < ApplicationRecord
    # Referênciar outro objeto colocando ":" seguido do nome dele
    belongs_to :kind, optional: true

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

    # Função que é chamada quando é invocada pelo método "I18n.translate(FUNCTION_NAME)", passando como parâmetro o nome da sentença que deve se traduzida
    # def hello
    #     I18n.t("hello")
    # end

    # def i18n
    #     I18n.default_locale # Mostra a linguagem padrão do sistema
    # end
end