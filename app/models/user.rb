class User < ActiveRecord::Base
	before_create :confirmation_token
	has_many :tests, :dependent => :destroy
	has_many :user_submissions 
	has_many :options , through: :user_submissions
  has_secure_password

  validates :first_name,
		presence: true
	validates :last_name,
		presence: true
	validates :email,
		presence: true,
		uniqueness: true
	validates_format_of :email, :with => /@/
	validates :password,
		presence: true

  private

  def confirmation_token
  	if self.confirm_token.blank?
  		self.confirm_token = SecureRandom.urlsafe_base64.to_s
  	end
end

	def email_activate
		self.email_confirmed = true
		self.confirm_token = nil
		save!(:validate => false)
	end

end
