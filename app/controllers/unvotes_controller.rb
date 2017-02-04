class UnvotesController < ApplicationController
	before_action :authenticate_user!

	def create
		question = Question.find(params[:question_id])
		if params[:answer_id].present?
			answer = Answer.find(params[:answer_id])
			answer.unvotes.create(user: current_user)
			if answer.voted_by? (current_user)
				answer.votes.where(user: current_user).take.try(:destroy)
			end

		else
			question.unvotes.create(user: current_user)
			if question.voted_by? (current_user)
				question.votes.where(user: current_user).take.try(:destroy)
			end
		end
		question.update(views:question.views -= 1)

		redirect_to question
	end

	def destroy
		question = Question.find(params[:question_id])
		if params[:answer_id].present?
			answer = Answer.find(params[:answer_id])
			answer.unvotes.where(user: current_user).take.destroy
		else
			question.unvotes.where(user: current_user).take.destroy
		end

		question.update(views:question.views -= 1)
		redirect_to question
	end
end
