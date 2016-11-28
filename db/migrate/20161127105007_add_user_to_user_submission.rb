class AddUserToUserSubmission < ActiveRecord::Migration
  def change
    add_reference :user_submissions, :user, index: true, foreign_key: true
  end
end
