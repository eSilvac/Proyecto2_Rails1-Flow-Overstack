class AnswersController < ApplicationController
	before_action :authenticate_user!

	def create
    	question = Question.find(params[:question_id])
    	question.answers.create(answer_params)
        question.update(views:question.views -= 1)
    	redirect_to question
    end

    def destroy
    	question = Question.find(params[:question_id])
    	answer = question.answers.find(params[:id])
    	answer.destroy
        question.update(views:question.views -= 1)
    	redirect_to question
    end

    private
	  	def answer_params
	  		params.require(:answer).permit(:body).merge(user: current_user)
	  	end
end
