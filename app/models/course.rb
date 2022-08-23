class Course < ApplicationRecord
  has_many :course_users
  belongs_to :book    # foreign_id as book_id
end
