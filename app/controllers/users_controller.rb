class UsersController < ApplicationController
	def index
		@users = User.all.sort_by {|hsh| hsh.questions.count + hsh.answers.count + hsh.votes.count + hsh.unvotes.count }.reverse
		if params[:tab] == "new"
			@users = User.order('created_at DESC')
		end
	end

	def show
		@user_show = User.find_by(username: params[:username])
	end

	def edit
		@user_edit = User.find_by(username: params[:username])
	end

	def update
		@user_edit = User.find_by(params[:username])
		if @user_edit.update(user_params)
			flash[:alert] = "Usuario Modificado Correctamente"
			redirect_to user_path(@user_edit.username)
		else
			render :edit			
		end
	end

	private
	  	def user_params
	  		params.require(:user).permit(:username, :email, :info, :twitter, :github, :about)
	  	end
end
