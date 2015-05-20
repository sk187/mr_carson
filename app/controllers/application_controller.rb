class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :authorize, :admin_user, :admin_logged_in?, :admin_authorize

    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authorize
        redirect_to '/login' unless current_user
    end

    def admin_user 
        @admin_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end

    def admin_logged_in?
        !!admin_user
    end

    def admin_authorize 
        redirect_to '/login' unless admin_user
    end
end
