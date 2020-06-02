# frozen_string_literal: true

class Teachers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :check
  # before_action :create

  # def check
  #   student = Student.find_by(email: params[:session][:email])

  #   if student 
  #     redirect_to new_student_session_path
  #   end
  # end

  # def create
  #   teacher = Teacher.find_by(email: params[:session][:email])
  #   student = Student.find_by(email: params[:session][:email])

  #   if teacher && teacher.authenticate(params[:session][:password])
  #     # session[:teacher_id] = teacher.id   #your pass to this application
  #     log_in teacher
  #     redirect_to root_url
  #   elsif
  #     student && student.authenticate(params[:session][:password])
  #     # session[:student_id] = student.id   #your pass to this application
  #     log_in student
  #     redirect_to root_url
  #   else
  #     render :new
  #   end
  # end
  # GET /resource/sign_in
  # def new
  #   super
  # end
  # def new
    
  # end

  # POST /resource/sign_in
  def create
    teacher = Teacher.find_for_authentication(email: params[:teachers][:email])
    student = Student.find_for_authentication(email: params[:teachers][:email])

    if teacher && teacher.valid_password?(params[:teachers][:password])
      sign_in(teacher)
      redirect_to root_url
    elsif student && student.valid_password?(params[:teachers][:password])
      sign_in(student) 
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    sign_out(current_teacher)
    redirect_to root_url
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
