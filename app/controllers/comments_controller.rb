class CommentsController < ApplicationController

	def create
        question = Question.find(params[:question_id])
        if params[:answer_id].present?
            answer = Answer.find(params[:answer_id])
            answer.comments.create(comment_params)
        else
        	question.comments.create(comment_params)
        end
        question.update(views:question.views -= 1)
        flash[:success] = "Publicada Correctamente"
    	redirect_to Question.find(params[:question_id])
    end

    def destroy
        question = Question.find(params[:question_id])
        if params[:answer_id].present?
            answer = Answer.find(params[:answer_id])
            answer.comments.where(params[:id]).try(:destroy)
        else
    	   question.comments.where(params[:id]).try(:destroy)
        end
        question.update(views:question.views -= 1)
    	redirect_to Question.find(params[:question_id])
    end

    private
	  	def comment_params
	  		params.require(:comment).permit(:body).merge(user: current_user)
	  	end
end
