class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(confirm_code: params[:confirm_code]) || nil
        if user
            session[:user_id] = user.id
            flash[:notice] = "Welcome Your Grace"
            redirect_to homes_path
        else
            flash[:error] = 'Either you are not authorized or you have
            entered your Confirmation Code incorrectly. Please make sure
            you have entered the correct Confirmation Code'
            redirect_to root_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "I shall await your return Your Grace"
        redirect_to root_path
    end
end
