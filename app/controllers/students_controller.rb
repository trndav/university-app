class StudentsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    
    # Must be before require_same_student
    before_action :set_student, only: [:show, :edit, :update]

    # restrict controllers like edit for users that are not logged user
    before_action :require_same_student, only: [:edit, :update]     

    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        debugger
        @student = Student.new(student_params)
        if @student.save
            flash[:notice] = "You have successfully signed up."
            redirect_to @student
        else
            render "new"
        end
    end

    def show        
    end

    def edit
    end

    def update
        if @student.update(student_params)
            flash[:notice] = "You have successfully updated your profile."
            redirect_to @student
        else
            render "edit"
        end
    end

    private

    def student_params
        params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end

    def set_student
        @student = Student.find(params[:id])
    end

    def require_same_student

        if current_user != @student
            flash[:notice] = "You can only edit your profile. user: #{current_user.inspect}, student: #{@student.inspect}"
            redirect_to student_path(current_user)
        end
    end
end