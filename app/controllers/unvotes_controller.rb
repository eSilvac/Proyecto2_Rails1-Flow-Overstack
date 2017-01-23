class UnvotesController < ApplicationController
	before_action :authenticate_user!

	def create
		unvote = Unvote.create(user: current_user)
		question = Question.find(params[:question_id])
		if question.votes.where(user: current_user).exists?
			question.votes.where(user: current_user).take.try(:destroy)
		end
		question.unvotes << unvote
		
		redirect_to question
	end

	def destroy
		question = Question.find(params[:question_id])
		question.unvotes.where(user: current_user).take.destroy

		redirect_to question
		#question = Question.find(params[:question_id])
	end
end
