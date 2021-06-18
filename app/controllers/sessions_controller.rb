class SessionsController < ApplicationController

def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
        secret_key = Rails.application.secrets.secret_key_base[0]
        token=JWT.encode({user_id: user.id}, secret_key)
        # render json: {status: 'Success', message: 'Logged in',data: user.as_json(only: [:id, :email])},status: :ok
        render json: {status: 'Success', message: 'Logged in',token: token},status: :ok

    else
        render json: {status: 'Error', message: 'Invalid email or password'},status: :unauthorized
    end
end
  end