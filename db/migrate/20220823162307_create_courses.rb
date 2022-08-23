class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :instructor_id
      t.integer :book_id

      t.timestamps
    end
  end
end
