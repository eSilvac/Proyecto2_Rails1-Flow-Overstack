class UnvotesController < ApplicationController
	before_action :authenticate_user!

	def create
		if params[:answer_id].present?
			answer = Answer.find(params[:answer_id])
			answer.unvotes.create(user: current_user)
			if answer.voted_by? (current_user)
				answer.votes.where(user: current_user).take.try(:destroy)
			end

		else
			question = Question.find(params[:question_id])
			question.unvotes.create(user: current_user)
			if question.voted_by? (current_user)
				question.votes.where(user: current_user).take.try(:destroy)
			end
		end
		redirect_to Question.find(params[:question_id])
	end

	def destroy
		if params[:answer_id].present?
			answer = Answer.find(params[:answer_id])
			answer.unvotes.where(user: current_user).take.destroy
		else
			question = Question.find(params[:question_id])
			question.unvotes.where(user: current_user).take.destroy
		end
		redirect_to Question.find(params[:question_id])
	end
end
