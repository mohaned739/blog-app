class ApplicationController < ActionController::API
    before_action :hooks
    before_action :authenticate
def authenticate
    authorization_header = request.headers[:authorization]
    if !authorization_header
        render json: {status: 'Error', message: 'You must login first'},status: :unauthorized
    else
        token = authorization_header.split(" ")[1]
        secret_key=Rails.application.secrets.secret_key_base[0]
        decoded_token= JWT.decode(token,secret_key)[0]
        @user = @users.find(decoded_token["user_id"])
    end
end

def hooks
    @posts=Post.order('id DESC')
    @tags=Tag.order('id')
    @comments=Comment.order('id')
    @users=User.order('id')
end
end
