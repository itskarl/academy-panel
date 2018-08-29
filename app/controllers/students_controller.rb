class StudentsController < ApplicationController


  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
  end

  def show
     @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'He gone now. Look what you\'ve done.' }
    end
  end

  def update
    @student.update(student_params)
    respond_to do |format|
      format.html { redirect_to @student, notice: 'Student was successfully updated.' }
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :education_level)
  end

end
