class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :create_person, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def show
     @user = User.find(params[:id])
  end

  def index
    if params[:sort]
      @users = User.all.order("#{params[:sort]} ASC")
    else
      @users = User.all
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'USER HAS BEEN DELETED SUCESSFULLY' }
      format.js   { render :layout => false }
    end
  end


  def update
    @user.update(user_params)
    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
    end
  end

  private

  def create_person

    if @user.student === true
      student = Student.new(
        first_name: @user.first_name,
        last_name: @user.last_name,
        password: "password",
      )
      student.save
    end

    if @user.instructor === true
      instructor = Instructor.new(
        first_name: @user.first_name,
        last_name: @user.last_name,
        password: "password",
      )
      instructor.save
    end

  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :admin, :student, :instructor, :photo)
  end

end
