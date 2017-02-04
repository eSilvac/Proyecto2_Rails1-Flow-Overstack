class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		question = Question.find(params[:question_id])
		fav = Favorite.create(user: current_user)
		question.favorites << fav
		question.update(views:question.views -= 1)
		redirect_to question
	end

	def destroy
		question = Question.find(params[:question_id])
		question.favorites.where(user: current_user).take.destroy
		question.update(views:question.views -= 1)
		redirect_to question
	end
end
