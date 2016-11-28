class OptionsController < ApplicationController
	before_action :set_question ,only: [:show,:edit, :create, :update, :destroy]
	before_action :set_option , only:[:destroy]

	def index
	end

	def show
	end

	def new
		@option = @question.option.new
	end

	def create
		if @question.options.create(option_params)
			redirect_to test_question_path(@question.test_id,@question), :notice => "You have created a new option"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @question.option.update(option_params)
			redirect_to question_path, :notice => "Edit Successful"
		else
			render 'edit'
		end
	end

	def destroy
		if @option.destroy
			redirect_to test_question_path(@question.test_id,@question), :notice => "Delete Successful"
		end
	end

	private 
	 def option_params
	 	params.require(:option).permit(:option_text, :answer)
	 end

	 def set_question
	 	@question = Question.find(params[:question_id])
	 end

	 def set_option
	 	@option = Option.find(params[:id])
	 end
end
