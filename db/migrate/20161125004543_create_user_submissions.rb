class CreateUserSubmissions < ActiveRecord::Migration
  def change
    create_table :user_submissions do |t|

      t.timestamps null: false
    end
  end
end
