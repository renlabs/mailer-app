class SessionsController < ApplicationController
	
	def new
		#redirect_to signin_path
	end

	def create
		user = User.find_by_username(params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = "Invalid email/password"
			render "new"
		end
	end

	def destroy
		sign_out
	end

end
