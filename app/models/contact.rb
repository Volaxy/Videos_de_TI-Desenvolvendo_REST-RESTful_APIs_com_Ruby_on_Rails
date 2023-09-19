class Contact < ApplicationRecord
    # Referênciar outro objeto colocando ":" seguido do nome dele
    belongs_to :kind

    def kind_description
        self.kind.description
    end

    def as_json(options = {})
        super(include: { kind: { only: [ :description ]}})
        # super(methods: [ :kind_description ]) # Vai retornar uma nova estrutura onde a descrição do outro objeto será exibida
    end
end
