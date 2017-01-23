class VotesController < ApplicationController
	before_action :authenticate_user!
	def create
		vote = Vote.create(user: current_user)
		question = Question.find(params[:question_id])
		if question.unvotes.where(user: current_user).exists?
			question.unvotes.where(user: current_user).take.try(:destroy)
		end
		question.votes << vote
		
		redirect_to question
	end

	def destroy
		question = Question.find(params[:question_id])
		question.votes.where(user: current_user).take.destroy

		redirect_to question
		#question = Question.find(params[:question_id])
	end
end
