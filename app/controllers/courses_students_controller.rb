class CoursesStudentsController < ApplicationController
    def new
        @course_student = CourseStudent.new
        @course = Course.where('id = ? or id = ?', params[:course_id], params[:format]).first
        @review = Review.find_by(student_id: current_student.id, course_id: @course.id)
        @teachers = Teacher.all
        @teacher = Teacher.find(@course.teacher_id)
        @registered = CourseStudent.find_by(student_id: current_student.id, course_id: @course.id)
        
        @button = "Register"    
        if @registered
            @button = "Drop Course"
        end
        
        @path = "/courses_students"
        @method = "post"
        if @button == "Drop Course"
            @path = "courses_student_path"
            @method = "delete"
        end
    end

    def create
        @course_student = CourseStudent.new
        @course = Course.find(params[:courses_students][:course_id])
        @course_student.course_id = @course.id
        @course_student.student_id = current_student.id
        
        if @course_student.save
            redirect_to student_courses_path
        else
            redirect_to new_courses_student_path(:course_id => "#{@course.id}")
        end        
    end

    def destroy
        @course = Course.find(params[:courses_students][:course_id])
        @course_student = CourseStudent.find_by(student_id: current_student.id, course_id: @course.id)
        @course_student.destroy
        redirect_to student_courses_path
    end

    
end
