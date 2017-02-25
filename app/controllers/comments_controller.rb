class CommentsController < ApplicationController

	def create

        @question = Question.find(params[:question_id])
        @question.update(views:@question.views -= 1)
        @comment = Comment.create(comment_params)
        if @comment.errors.any?
            @comment.errors.full_messages.each do |error|
                flash[:error] = error
            end
            redirect_to @question
        else
           if params[:answer_id].present?
                answer = Answer.find(params[:answer_id])
                answer.comments << @comment
            else
                @question.comments << @comment
            end
            flash[:success] = "Publicada Correctamente"
            redirect_to @question
        end

    end

    def destroy
        question = Question.find(params[:question_id])
        comment = Comment.find(params[:id])
        comment.destroy
        flash[:error] = "Comentario Eliminado Correctamente"
        question.update(views:question.views -= 1)
    	redirect_to question
    end

    private
	  	def comment_params
	  		params.require(:comment).permit(:body).merge(user: current_user)
	  	end
end
