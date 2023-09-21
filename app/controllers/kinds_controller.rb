class KindsController < ApplicationController
    # No "Postman", clicar na aba "Authorization" e escolher o método "Digest Auth", preenchendo com o username "jack" e a senha "secret"
    include ActionController::HttpAuthentication::Digest::ControllerMethods
    USERS = {"jack" => OpenSSL::Digest::MD5.hexdigest(["jack","Application","secret"].join(":"))}  #ha1 digest password

    before_action :authenticate
    before_action :set_kind, only: %i[ show update destroy ]

    # GET /kinds
    def index
        @kinds = Kind.all

        render json: @kinds
    end

    # GET /kinds/1
    def show
        render json: @kind
    end

    # POST /kinds
    def create
        @kind = Kind.new(kind_params)

        if @kind.save
            render json: @kind, status: :created, location: @kind
        else
            render json: @kind.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /kinds/1
    def update
        if @kind.update(kind_params)
            render json: @kind
        else
            render json: @kind.errors, status: :unprocessable_entity
        end
    end

    # DELETE /kinds/1
    def destroy
        @kind.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_kind
            # Caso no caminho da URL, contenha o Id do "Contact", ele procura o "Contact" e retorna o "Kind" relacionado a ele
            if params[:contact_id]
                return @kind = Contact.find(params[:contact_id]).kind
            end

            @kind = Kind.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def kind_params
            params.require(:kind).permit(:description)
        end

        def authenticate
            authenticate_or_request_with_http_digest("Application") do |username|
                USERS[username]
            end
        end
end
