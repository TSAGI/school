class ReviewsController < ApplicationController
    def new
        @review = Review.new
        @course = Course.find(params[:course_id])
    end

    def create
        @course = Course.find(params[:course_id])
        @review = Review.new
        @review.message = params[:review][:message]
        @review.student_id = current_student.id
        @review.course_id = @course.id
        
        if @review.save
            redirect_to new_courses_student_path(@course)
        else
            render :new
        end        
    end

    def edit
        @course = Course.find(params[:course_id])
        @review = Review.find(params[:id])
    end

    def update
        @course = Course.find(params[:course_id])
        @review = Review.find(params[:id])

        if @review.update_attributes(
            message: params[:review][:message],
            student_id: current_student.id,
            course_id: @course.id
        )
            redirect_to new_courses_student_path(@course)
        else
            render :edit
        end
    end

    def destroy
        @course = Course.find(params[:course_id])
        @review = Review.find_by(course_id: @course.id, student_id: current_student.id)
        @review.destroy
        redirect_to new_courses_student_path(@course)
    end

    private
      def review_params
        params.require(:reviews).permit(:message, :student_id, :course_id)
      end

end
