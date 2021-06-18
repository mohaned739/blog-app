class RegisterationsController < ApplicationController
    skip_before_action :authenticate
   def create
       user=User.create(
           name: params[:name],
           email: params[:email],
           image: params[:image],
           password: params[:password]
       )
        if user.save
            render json: {status: 'Success', message: 'User Added',data: user},status: :ok
        else
            render json: {status: 'Error', message: 'User not saved',data: user.errors},status: :unprocessable_entity
        end
    end
  end