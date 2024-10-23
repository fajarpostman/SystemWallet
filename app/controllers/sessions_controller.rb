class SessionsController < ApplicationController
    def create
      user = User.find_by(email: session_params[:email])
  
      if user.nil?
        render json: { error: 'Invalid email or password' }, status: :unauthorized
        return
      end
  
      if BCrypt::Password.new(user.encrypted_password) == session_params[:password]
        session[:user_id] = user.id
        render json: { message: 'Logged in successfully' }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def session_params
      params.require(:session).permit(:email, :password)
    end
  end
  