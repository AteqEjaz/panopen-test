class CreateCourseUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :course_users do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    add_index :course_users, :course_id

  end
end
