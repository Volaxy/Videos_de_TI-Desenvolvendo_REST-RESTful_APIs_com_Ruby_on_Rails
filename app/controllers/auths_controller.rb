class AuthsController < ApplicationController
    def create
        hmac_secret = "my$ecretK3y" # "Secret" para validar a assinatura
        payload = {name: params[:name]}
        token = JWT.encode payload, hmac_secret, "HS256" # Codifica os dados
        render json: { token: token }
    end
end
