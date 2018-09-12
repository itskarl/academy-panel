class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]


  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to @instructor
      add_email
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @instructor.cohorts << Cohort.find(params[:q][:cohort_ids]) if params[:q]
    @instructor = Instructor.find(params[:id])
  end

  def index
    if params[:sort]
      @instructors = Instructor.all.order("#{params[:sort]} ASC")
    else
      @instructors = Instructor.all
    end
  end

  def destroy
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_url, notice: 'INSTRUCTOR WAS DELETED SUCCESSFULLY' }
      format.js   { render :layout => false }
    end
  end

  def update
    @instructor.update(instructor_params)
    respond_to do |format|
      format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
    end
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def add_email
    @instructor.update(email: "#{@instructor.first_name}_#{@instructor.last_name}@academyAF.com")

    user = User.new(
      first_name: @instructor.first_name,
      last_name: @instructor.last_name,
      password: 'password',
      email: @instructor.email,
      instructor: true
    )
    user.save

  end

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :education_level, :age, :salary, :email, :password, :photo)
  end

end
