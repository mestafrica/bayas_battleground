class UserSubmission < ActiveRecord::Base
	belongs_to :options
	belongs_to :users
end
