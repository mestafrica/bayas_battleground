class Test < ActiveRecord::Base
	has_many :questions , :dependent => :destroy
	belongs_to :user

	validates :title , presence: true
	validates :time, presence: true
	validates :description, presence: true
end
