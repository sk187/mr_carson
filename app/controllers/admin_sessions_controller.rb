class AdminSessionsController < ApplicationController
    def create
        @admin = Admin.authenticate(params[:username], params[:password])
        if @admin
            flash[:notice] = 'Welcome Back Milord'
            session[:admin_id] = admin.id
            redirect_to admins_path
        else 
            redirect_to new_admins_path
        end
    end

    def destroy
        session[:admin_id] = nil
        flash[:notice] = "I shall await your return Milord"
        redirect_to root_path
    end
end
