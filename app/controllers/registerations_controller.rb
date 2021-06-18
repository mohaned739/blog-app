class RegisterationsController < ApplicationController
   
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
    # respond_to :json
    # def create
    #     build_resource(sign_up_params)
    #     if resource.save
    #    render_success_response({
    #     user: single_serializer(resource, UserSerializer)
    #    }, "User Created")
    #     else
    #     render_unprocessable_entity_response(resource)
    #     end
    #    end
  end