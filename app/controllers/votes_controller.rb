class VotesController < ApplicationController
	before_action :authenticate_user!
	def create
		question = Question.find(params[:question_id])
		if params[:answer_id].present?
			answer = Answer.find(params[:answer_id])
			answer.votes.create(user: current_user)
			if answer.unvoted_by? (current_user)
				answer.unvotes.where(user: current_user).take.try(:destroy)
			end

		else
			question.votes.create(user: current_user)
			if question.unvoted_by? (current_user)
				question.unvotes.where(user: current_user).take.try(:destroy)
			end
		end

		question.update(views:question.views -= 1)

		redirect_to question
	end

	def destroy
		question = Question.find(params[:question_id])
		if params[:answer_id].present?
			answer = Answer.find(params[:answer_id])
			answer.votes.where(user: current_user).take.destroy
		else
			question.votes.where(user: current_user).take.destroy
		end	

		question.update(views:question.views -= 1)

		redirect_to question	
	end
end
