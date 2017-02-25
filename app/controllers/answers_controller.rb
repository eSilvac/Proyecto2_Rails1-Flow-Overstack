class AnswersController < ApplicationController
	before_action :authenticate_user!

	def create
    	@question = Question.find(params[:question_id])
    	@answer_new = @question.answers.create(answer_params)
        @question.update(views:@question.views -= 1)
        if @answer_new.errors.any?
            @answer_new.errors.full_messages.each do |error|
                flash[:error] = error
            end
            redirect_to @question
        else
            flash[:success] = "Pregunta Publicada Correctamente"
            redirect_to @question
    	   
        end
    end

    def destroy
    	question = Question.find(params[:question_id])
    	answer = question.answers.find(params[:id])
    	answer.destroy
        question.update(views:question.views -= 1)
        flash[:error] = "Respuesta Eliminada Correctamente"
    	redirect_to question
    end

    private
	  	def answer_params
	  		params.require(:answer).permit(:body).merge(user: current_user)
	  	end
end
