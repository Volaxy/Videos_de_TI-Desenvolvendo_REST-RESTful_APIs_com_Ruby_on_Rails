class Contact < ApplicationRecord
    def author
        "Jackson"
    end

    def as_json(options={})
        super(methods: :author, root: true) # Chama o método original e passa como parâmetro os atributos da resposta da requisição
    end
end
