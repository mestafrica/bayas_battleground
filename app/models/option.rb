class Option < ActiveRecord::Base
	belongs_to :question
	has_many :user_submissions
	has_many :users , through: :user_submissions

	validates :question_id , presence: true
	validates :option_text , presence: true
end
