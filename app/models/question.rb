class Question < ActiveRecord::Base
	belongs_to :test 
	has_many :options, :dependent => :destroy

	validates :test_id , 		presence: true
	validates :question_text , 	presence: true
end
