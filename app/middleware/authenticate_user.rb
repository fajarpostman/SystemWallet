class ApplicationController < ActionController::API
    before_action :authenticate_user!
  
    private
  
    def authenticate_user!
      unless logged_in?
        render json: { error: 'User not logged in' }, status: :unauthorized
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
  