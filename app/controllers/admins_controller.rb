class AdminsController < ApplicationController
    def index
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            session[:admin_id] = @admin.id
            flash[:notice] = "Welcome to the Aquatic Oasis Milord"
            redirect_to admins_path
        else
            if params[:admin][:username].length == 0
                flash[:error] = "Username Can't Be Blank"
            elsif params[:admin][:password] != params[:admin][:password_confirmation]
                flash[:error] = "Password and Confirmation are not the same"
            elsif params[:admin][:password].length == 0
                flash[:error] = "Password Can't Be Blank"  
            elsif admin = Admin.find_by(username: params[:admin][:username])
                flash[:error] = "User Already Exists"                                                                                             
            end
            redirect_to new_admin_path
        end
    end

     def new
        @admin = Admin.new
    end
    
    def destory
    end

    private 

    def admin_params 
        params.require(:admin).permit(:username, :password, :password_confirmation)
    end
end
