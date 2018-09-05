class SessionsController < ApplicationController

  def new
    render layout: 'login'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      render 'pages/index'
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: '* INVADLID CREDENTIALS. PLEASE TRY AGAIN. *' }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    log_out if logged_in?
    p 'logged out successfully'
    redirect_to root_path
  end


end
