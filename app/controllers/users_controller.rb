class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
    @users = User.all
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'He gone now. Look what you\'ve done.' }
    end
  end

  def update
    @user.update(user_params)
    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :admin, :student, :instructor)
  end

end
