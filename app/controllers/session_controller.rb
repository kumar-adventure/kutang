class SessionController < ApplicationController
before_filter :user_remembered?
  def new
    if current_user
      if admin?
        redirect_to admin_url
      else
        redirect_to root_url
      end
    end
  end

  def create
  session_user = params[:session]
    user = User.find_by_email(session_user[:field1])
    user = User.find_by_nickname(session_user[:field1]) if user.nil?
    if user and user.authenticate(session_user[:password])
      session[:user_id] = user.id
      if params[:keep_signed]
        cookies[:auth_token] = { :value => user.token, :expires => 24.weeks.from_now }
      else
        cookies[:auth_token] = user.token
      end

      if admin?
        redirect_to admin_url, notice: "Logged in successfully."
      else
        redirect_to root_url, notice: "Logged in successfully."
      end
    else
       redirect_to login_url, notice: "Invalid email/ nickname/ password combination"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_url, notice: "Logged out"
  end

end
