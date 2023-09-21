class AddressesController < ApplicationController
    before_action :set_contact

    # GET /contacts/1/address
    def show
        render json: @contact.address
    end

    # POST /contacts/1/address
    def create
        # FIXME: Quando eu tento salvar somente 1 endereço, ele da o erro:
        # ActiveRecord::RecordNotSaved (Failed to remove the existing associated address. The record failed to save after its foreign key was set to nil.):
        @contact.address = Address.new(address_params)

        if @contact.save
            render json: @contact.address, status: :created
        else
            render json: @contact.address.errors, status: :unprocessable_entity
        end
    end

    # PUT
    def update
        puts params
        if @contact.address.update(address_params)
            render json: @contact.address
        else
            render json: @contact.address.errors, status: :unprocessable_entity
        end
    end

    # DELETE /contacts/1/address
    def destroy
        @contact.address.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_contact
            return @contact = Contact.find(params[:contact_id])
        end

        def address_params
            params.require(:address).permit(
                :street,
                :city
            )
        end
end