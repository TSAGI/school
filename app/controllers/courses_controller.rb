class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        @course = Course.find(params[:id])
        @teachers = Teacher.all
        @teacher = Teacher.find(@course.teacher_id)
        @reviews = Review.where(course_id: @course.id)
    end

    def student_courses
        @courses = Course.all
        @selection = CourseStudent.where(student_id: current_student.id)
    end

    def teacher_courses
        @courses = Course.all
    end

    def teacher_course
        @course = Course.find_by(id: params[:format])
        @selection = CourseStudent.where(course_id: @course.id) 
        @students = Student.all       
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if current_teacher
            @course.teacher_id = current_teacher.id
        end
        if @course.save
            redirect_to teacher_courses_path  
        else
          render :new
        end
    end

    def edit
        @course = Course.find(params[:id])
        @teacher = Teacher.find_by(:id == @course.teacher_id)
    end

    def update
        @course = Course.find(params[:id])

        if @course.update_attributes(course_params)
            redirect_to teacher_course_path(@course)
        else
            render :edit
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        redirect_to teacher_courses_path
    end

    private
      def course_params
        params.require(:course).permit(:name, :description, :day, :time, :date, :teacher_id)
      end
end
