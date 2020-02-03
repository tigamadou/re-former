class UsersController < ApplicationController

	def new
	end
	
	def create
		@user = User.new(username: params[:username], email: params[:email], password: params[:password])

		if @user.save
				redirect_to new_user_path, flash: {success: 'User created!'}
		else
			redirect_to new_user_path, flash: {danger: 'Oops. This email is already used!'}
		end
	end
end
