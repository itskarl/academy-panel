class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]
  after_action :add_email, only: [:create]

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

  def edit; end

  def show
    @student.cohorts << Cohort.find(params[:q][:q]) if params[:q]
    @student = Student.find(params[:id])
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
      format.html { redirect_to students_url, notice: 'He gone now. Look what you\'ve done.' }
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
    @student.update(email: "#{@student.first_name}.#{@student.last_name}@digi-academy.com")
  end

  def addmore; end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :education_level, :password, :cohort_ids)
  end
end
