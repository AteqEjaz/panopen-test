require 'faker'
namespace :db do
  desc "Create a Course with 1 book, 1 instructor and 15 students"
  task :create_course => :environment do

    Rails.logger.info "================ #{Time.now}: Setting up Course for PenOpen Demo ========== "
    # create an instructor
    instructor_name =  Faker::Name.unique.name
    instructor_email =  Faker::Internet.unique.email
    ROLE = "instructor".freeze

    # create a Book
    book_name = Faker::Commerce.unique.product_name
    book_content = ""
    50.times do book_content = book_content + Faker::ChuckNorris.fact end


    # Create a Course
     course_name = Faker::Commerce.unique.product_name

    ActiveRecord::Base.transaction do
      # create an instructor
      instructor = User.create!(name:instructor_name, email:instructor_email, role:ROLE)
      # create a book
      book = Book.create(name: book_name, content:book_content)
      #create a course
      course =  Course.create!(name: course_name, book_id: book.id, instructor_id: instructor.id)

      for i in 1..15
        # Create 15 students
       instructor_name =  Faker::Name.unique.name
       instructor_email =  Faker::Internet.unique.email
       STUDENT_ROLE = "student".freeze
       user  = User.new(name:instructor_name, email:instructor_email, role:STUDENT_ROLE)
        if user.save!
          # Associate students with  course
          CourseUser.find_or_create_by(user_id: user.id,course_id: course.id)
          # Add user readings for book or for a course
          user_book_reading_time = rand(1..1000)
          UserReading.create(book_id: book.id, course_id: course.id, user_id: user.id,reading_time_in_sec: user_book_reading_time )
        else
          puts "Failed to create user"
        end
     end
    end
  end
end