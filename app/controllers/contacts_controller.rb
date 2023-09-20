class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show update destroy ]

    # GET /contacts
    def index
        @contacts = Contact.all

        render json: @contacts
        # Imprime a data no formato pt-BR
        # render json: @contacts, methods: [:birthdate_br] #, methods: [:hello, :i18n] # Métodos de tradução que estão sendo executados (neste caso) juntamente com a impressão dos dados
    end

    # GET /contacts/1
    def show
        render json: @contact.to_br
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
            # Os parâmetros enviados no corpo da requisição do "body" só serão aceitos caso estejam inseridos dentro do método "permit()"
            params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
        end
end
