class PanopenCoursesController < ApplicationController

  before_action :find_course, only:[:list_course_students]
  before_action :validate_user, only:[:update_user]
  def list_courses
    @courses = Course.all
  end

  def list_course_students
  end

  def update_user

  end

  def update_user_name
    user = User.find_by_email(params["user_email"])
    if user
      user.name = params["user_name"]
      if user.save!
        flash[:error] = "User updated successfully"
        redirect_to '/'
      else
        flash[:error] = "User not updated"
        redirect_to '/'
      end
    else
      flash[:error] = "User not found"
      redirect_to '/'
    end
  end

  private

  def find_course
    @course = Course.find(params["id"].to_i) rescue nil
    unless @course
      flash[:error] = "Invalid Course"
      redirect_to '/'
    end
  end

  def validate_user
    @user = User.find(params["id"].to_i) rescue nil
    unless @user
      flash[:error] = "Invalid user"
      redirect_to '/'
    end
  end

end
