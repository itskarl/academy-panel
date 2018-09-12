class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]
  # after_action :add_email, only: [:create]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
      add_email
    else
      render 'new'
    end
  end

  def edit; end

  def show
    @student = Student.find(params[:id])
    @student.cohorts << Cohort.find(params[:q][:q]) if params[:q]
    @student.cohorts.delete(Cohort.find(params[:removecohort])) if params[:removecohort]
  end

  def index
    if params[:sort]
      @students = Student.all.order("#{params[:sort]} ASC")
    else
      @students = Student.all
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'STUDENT SUCCESSFULLY DELETED' }
      format.js   { render :layout => false }
    end
  end

  def update
    @student.update(student_params)
    respond_to do |format|
      format.html { redirect_to @student, notice: 'UPDATE SUCESSSSFULLLLLLLLLL' }
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def add_email
    @student.update(email: "#{@student.first_name}_#{@student.last_name}@academyaf.com")
    user = User.new(
      first_name: @student.first_name,
      last_name: @student.last_name,
      password: 'password',
      email: @student.email,
      student: true
    )
    user.save
  end

  def addmore; end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :education_level, :password, :cohort_ids)
  end
end
