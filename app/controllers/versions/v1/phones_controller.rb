module Versions::V1
    class PhonesController < ApplicationController
        before_action :set_contact

        # GET /contacts/1/phones
        def show
            render json: @contact.phones
        end

        # POST /contacts/1/phone
        def create
            @contact.phones << Phone.new(phone_params)

            if @contact.phones
                render json: @contact.phones, status: :created
            else
                render json: @contact.phones.errors, status: :unprocessable_entity
            end
        end

        # PUT /contacts/1/phone
        def update
            phone = Phone.find(phone_params[:id])
            
            if phone.update(phone_params)
                render json: @contact.phones
            else
                render json: @contact.phones.errors, status: :unprocessable_entity
            end
        end

        # DELETE /contacts/1/phone
        def destroy
            phone = Phone.find(phone_params[:id])
            phone.destroy
        end

        private
            # Use callbacks to share common setup or constraints between actions.
            def set_contact
                return @contact = Contact.find(params[:contact_id])
            end

            def phone_params
                params.require(:phone).permit(
                    :id,
                    :number
                )
            end
    end
end