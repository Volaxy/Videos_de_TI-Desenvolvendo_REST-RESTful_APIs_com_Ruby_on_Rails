class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show update destroy ]

    # GET /contacts
    def index
        @contacts = Contact.all

        render json: @contacts
    end

    # GET /contacts/1
    def show
        # O objetivo desse commit é fazer aparecer tanto o Tipo de contato (Kind), quanto a data formatada no padrão pt-BR, pois com a inclusão do :kind, o método ".to_br" acaba por sobrescrever a inclusão do valor :kind
        # render json: @contact.to_br, include: :kind

        render json: @contact, include: :kind
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
