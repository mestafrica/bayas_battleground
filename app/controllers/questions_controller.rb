class QuestionsController < ApplicationController
	before_action :set_test ,only: [:show,:create,:update, :destroy, :display]
	before_action :set_question ,only: [:show,:edit , :destroy]

	def index
	end

	def show
	end

	def new
	end

	def create
		@question = @test.questions.new(question_params)
		if @test.questions.create(question_params)
			redirect_to test_path(@test), :notice => "You have created a new question"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @test.question.update(question_params)
			redirect_to test_path, :notice => "Edit Successful"
		else
			render 'edit'
		end
	end

	def destroy
		if @question.destroy
			redirect_to test_path(@test), :notice => "Delete Successful"
		end
	end

	def display
	end

	private 
	 def question_params
	 	params.require(:question).permit(:question_text)
	 end

	 def set_question
	  	@question = Question.find(params[:id])
	 end

	 def set_test
	 	@test = Test.find(params[:test_id])
	 end
end
