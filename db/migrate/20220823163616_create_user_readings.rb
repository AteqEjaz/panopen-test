class CreateUserReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_readings do |t|
      t.integer :course_id
      t.integer :book_id
      t.integer :user_id
      t.decimal :reading_time_in_sec

      t.timestamps
    end

    add_index :user_readings, :user_id
  end
end
