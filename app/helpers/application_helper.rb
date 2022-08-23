module ApplicationHelper

  def course_instructor(instructor_id)
    User.find(instructor_id).name rescue ''
  end

  def user_name(user_id)
    User.find(user_id).name  rescue ''
  end

  def user_email(user_id)
    User.find(user_id).email  rescue ''
  end

  def course_book(course_id)
    Course.find(course_id).book.name  rescue ''
  end

  def user_course_reading(course)
     user_reading = UserReading.where(course_id: course.course_id , user_id: course.user_id) rescue ""
    unless user_reading.empty?
      (user_reading.first.reading_time_in_sec.to_f/60.0).ceil rescue " Error "
    end
  end
end
