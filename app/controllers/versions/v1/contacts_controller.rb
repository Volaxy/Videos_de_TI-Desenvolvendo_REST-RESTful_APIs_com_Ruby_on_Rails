module Versions::V1
    class ContactsController < ApplicationController
        before_action :set_contact, only: %i[ show update destroy ]

        # GET /contacts
        def index
            # O ".page" informa em qual página que será retornado os dados, e de acordo com o ":page" será informado pela URL o número da página que será acessada
            # O ".per" informa quantos elementos por página a busca deverá ter
            # @contacts = Contact.all.page(params[:page]).per(5)
            # @contacts = Contact.all.page(params[:page]) # O ".per" é retirado por causa do "api-pagination"

            # Seta um tempo de expiração do cache do navegador, na 1ª requisição é retornado o código 200, mas antes do tempo expirar, o código que será devolvido para cada nova requisição será o 304
            # O próprio rails já realiza uma cache caso o mesmo recurso seja acessado várias vezes
            # expires_in 30.seconds, public: true

            # Ao receber a resposta, no cabeçalho haverá um header chamado "ETag" que conterá um valor, esse valor será passado no header da requisição através da variável "If-None-Match"
            # if stale?(etag: @contacts)
            @contacts = Contact.all

            render json: @contacts, include: [ :kind, :phones, :address ]
            # end

            # paginate json: @contacts
        end

        # GET /contacts/1
        def show
            render json: @contact, include: [ :kind, :phones, :address ]
        end

        # POST /contacts
        def create
            @contact = Contact.new(contact_params)

            if @contact.save
                render json: @contact, include: [ :kind, :phones, :address ], status: :created, location: @contact
            else
                render json: @contact.errors, status: :unprocessable_entity
            end
        end

        # PATCH/PUT /contacts/1
        # Caso não se passe o "id" nos atributos aninhado (Phone nesse caso), ele não atualizará os telefones, e sim criará novos dados de telefones
        def update
            if @contact.update(contact_params)
                render json: @contact, include: [ :kind, :phones, :address ]
            else
                render json: @contact.errors, status: :unprocessable_entity
            end
        end

        # DELETE /contacts/1
        def destroy
            @contact.destroy
        end

        private
            # Use callbacks to share common setup or constraints between actions.
            def set_contact
                @contact = Contact.find(params[:id])
            end

            # Only allow a list of trusted parameters through.
            def contact_params
                # Os parâmetros enviados no corpo da requisição do "body" só serão aceitos caso estejam inseridos dentro do método "permit()"
                # params.require(:contact).permit(:name, :email, :birthdate, :kind_id, phones_attributes: [:number])

                # Pode-se mudar o nome "phones_attributes" para outro qualquer para o nome no retorno ficar de outra forma
                params.require(:contact).permit(
                    :name,
                    :email,
                    :birthdate,
                    :kind_id,
                    phones_attributes: [ :id, :number, :_destroy ],
                    address_attributes: [ :id, :street, :city ]
                )
            end
    end
end