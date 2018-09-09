class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
  end

  def show
     @course = Course.find(params[:id])
  end

  def index
    if params[:sort] == "hours"
      @courses = Course.all.order('hours ASC')
    elsif params[:sort] == "course"
      @courses = Course.all.order('name ASC')
    else
      @courses = Course.all
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'COURSE WAS SUCCESSFULLY DELETED' }
        format.js   { render :layout => false }
    end
  end

  def update
    @course.update(course_params)
    respond_to do |format|
      format.html { redirect_to @course, notice: 'Course was successfully updated.' }
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :hours)
  end

end
