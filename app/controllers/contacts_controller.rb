class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show update destroy ]

    # GET /contacts
    def index
        @contacts = Contact.all

        render json: @contacts
    end

    # GET /contacts/1
    def show
        render json: @contact, include: [ :kind, :phones ]
    end

    # POST /contacts
    def create
        @contact = Contact.new(contact_params)

        if @contact.save
            render json: @contact, include: [ :kind, :phones ], status: :created, location: @contact
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /contacts/1
    # Caso não se passe o "id" nos atributos aninhado (Phone nesse caso), ele não atualizará os telefones, e sim criará novos dados de telefones
    def update
        if @contact.update(contact_params)
            render json: @contact, include: [ :kind, :phones ]
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
            params.require(:contact).permit(:name, :email, :birthdate, :kind_id, phones_attributes: [:id, :number, :_destroy])
        end
end
