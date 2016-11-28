class AddOptionToUserSubmission < ActiveRecord::Migration
  def change
    add_reference :user_submissions, :option, index: true, foreign_key: true
  end
end
