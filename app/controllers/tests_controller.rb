class TestsController < ApplicationController
	before_action :set_test ,only: [:show,:edit, :update, :destroy,:quiz]

	def index
		@tests = Test.all
	end

	def show
	end

	def new
		@test = Test.new
	end

	def create
		@test = Test.new(test_params)
		if @test.save
			redirect_to tests_path, :notice => "You have created a new test"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @test.update(test_params)
			redirect_to tests_path, :notice => "Edit Successful"
		else
			render 'edit'
		end
	end

	def destroy
		if @test.destroy
			redirect_to tests_path, :notice => "Delete SUccessful"
		end
	end

	def display
		@tests = Test.all
	end

	def quiz
	end

	def submission
	end

	private 
	 def test_params
	 	params.require(:test).permit(:title, :time, :description)
	 end

	 def set_test
	 	@test = Test.find(params[:id])
	 end
end
