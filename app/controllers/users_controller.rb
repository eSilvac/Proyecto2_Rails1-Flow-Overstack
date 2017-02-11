class UsersController < ApplicationController
	def index
		@users = User.all.sort_by {|hsh| hsh.questions.count + hsh.answers.count + hsh.votes.count + hsh.unvotes.count }.reverse
		if params[:tab] == "new"
			@users = User.order('created_at DESC')
		end
	end

	def show
		@user = User.find(params[:id])
	end
end
