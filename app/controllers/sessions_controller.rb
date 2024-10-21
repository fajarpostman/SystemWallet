class SessionsController < ApplicationController
    def create
        user = User.find_by(name: params[:name])
        if user
            session[:user_id] = user.id
            render json: { message: 'Signed in successfully', user_id: user.id },  status: :ok
        else
            render json: { error: 'Invalid user' }, status: :unauthorized
        end
    end

    def destroy
        session.delete(:user_id)
        render json: { message: 'Signed out successfully' }, status: :ok
    end
end
