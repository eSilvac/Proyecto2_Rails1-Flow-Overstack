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
    	redirect_to question
    end

    def destroy
        question = Question.find(params[:question_id])
        comment = Comment.find(params[:id])
        comment.destroy
       
        question.update(views:question.views -= 1)
    	redirect_to question
    end

    private
	  	def comment_params
	  		params.require(:comment).permit(:body).merge(user: current_user)
	  	end
end
