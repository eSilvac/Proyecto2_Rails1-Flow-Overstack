class CommentsController < ApplicationController

	def create
        if params[:answer_id].present?
            answer = Answer.find(params[:answer_id])
            answer.comments.create(comment_params)
        else
        	question = Question.find(params[:question_id])
        	question.comments.create(comment_params)
        end
    	redirect_to Question.find(params[:question_id])
    end

    def destroy
        if params[:answer_id].present?
            answer = Answer.find(params[:answer_id])
            answer.comments.where(params[:id]).take.destroy
        else
    	   question = Question.find(params[:question_id])
    	   question.comments.where(params[:id]).take.destroy

        end
    	redirect_to Question.find(params[:question_id])
    end

    private
	  	def comment_params
	  		params.require(:comment).permit(:body).merge(user: current_user)
	  	end
end
