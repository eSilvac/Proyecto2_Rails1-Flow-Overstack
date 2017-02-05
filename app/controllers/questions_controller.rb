class QuestionsController < ApplicationController
 	before_action :authenticate_user!, except: [:index, :show]
 	
 	def index
  		@questions = Question.all
  	end

  	def new
  		@question = Question.new
  	end

  	def create
  		@question = Question.create(question_params)
  		@question.user = current_user
      @question.views = 0
  		if @question.save
  			redirect_to questions_path
  		else
  			render :new
  		end
  	end

  	def show
  		@question = Question.find(params[:id])
      @question.update(views:@question.views += 1)
      
  	end

  	def edit
  		@question = Question.find(params[:id])
  	end

  	def update
  		@question = Question.find(params[:id])
  		if @question.update(question_params)
  			redirect_to @question
  		else
  			render :edit
  		end  		
  	end

    def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to questions_path
    end

  	private
	  	def question_params
	  		params.require(:question).permit(:title, :body)
	  	end
end
