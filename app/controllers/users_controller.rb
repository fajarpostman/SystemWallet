class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    
    if params[:user][:password].present?
      user.encrypted_password = encrypt_password(params[:user][:password]) # Encrypt password
    end
    
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) # No password here
  end

  def encrypt_password(password)
    BCrypt::Password.create(password) # Encrypt the password
  end
end


