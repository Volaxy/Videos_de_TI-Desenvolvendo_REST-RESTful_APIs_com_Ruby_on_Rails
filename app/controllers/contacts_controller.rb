class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show update destroy ]

    # GET /contacts
    def index
        @contacts = Contact.all

        render json: @contacts
        # render json: @contacts, methods: :author # Executa um método dentro do objeto "Contact" e atribui como chave o "author" e como valor o retorno do método
        # render json: @contacts.attributes.merge({ author: "Jackson" }) # Adiciona um novo dado aos atributos já existentes de uma coleção
        # render json: @contacts, only: [:name, :email] # O "only" define quais atributos vão ser enviados através da resposta HTTP
        # render json: @contacts, except: [:name, :email] # O "except" define quais atributos NÃO vão ser enviados através da resposta HTTP
        # render json: @contacts, root: true # O "root" envia junto com o corpo da resposta, o tipo do objeto enviado
        # render json: @contacts, status: :no_content # O atributo "status" indica o tipo de código HTTP que será enviado como resposta à requisição
    end

    # GET /contacts/1
    def show
        render json: @contact
    end

    # POST /contacts
    def create
        @contact = Contact.new(contact_params)

        if @contact.save
            render json: @contact, status: :created, location: @contact
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /contacts/1
    def update
        if @contact.update(contact_params)
            render json: @contact
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
            params.require(:contact).permit(:name, :email, :birthdate)
        end
end
