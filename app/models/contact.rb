class Contact < ApplicationRecord
    # Referênciar outro objeto colocando ":" seguido do nome dele
    belongs_to :kind
end
