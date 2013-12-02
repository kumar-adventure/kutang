class UsersController < ApplicationController
  before_filter :user_remembered?
  before_filter :current_location
  #before_filter :user_required, except: [:new, :create, :forgot_password, :search_user]
  before_filter :ad_expire?
  #before_filter :store_location, except: [:new, :create, :show, :update, :search_user]


  def show
    @user = User.find(params[:id])
  end

=begin
  def new
    if current_user
      redirect_to root_url, notice: "You are already login"
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end
=end

  def update_password
    @user = User.find(params[:id])
    if params.include?('current_password')
      result = false
      (@user.errors.add('Invalid current password','. Please enter your correct password.'); result = true ) unless @user.authenticate(params[:current_password])
      (@user.errors.add('Invalid password.',' Please enter valid password (length should be 6 digits).'); result = true ) if params[:user][:password].blank? || params[:user][:password].to_s.length < 6
      (@user.errors.add("Re-type password didn't",' match.'); result = true ) unless params[:user][:password_confirmation].eql?(params[:user][:password])
      if result
        render action: "change_password"
      else
        @user.update_attributes(params[:user])
        redirect_to change_password_path, :notice => "Password changed successfully."
      end
    else
      if @user.update_attributes(params[:user])
        redirect_to session[:current_url], :notice => "User profile updated successfully."
      else
        render action: "my_profile"
      end
    end
  end


=begin
  def new_password
    user = params[:update_user]
    @user = current_user
    if @user.password != user[:current_password]
      @user.errors.add(:current_password, "Current password doesn't match.")
      if @user.authenticate(user[:current_password])
         @user.password = user[:password]
         if @user.save
          redirect_to change_password_path, notice: 'Password was successfully updated.'
        else
          render action: "my_profile"
        end
      end
    else
        redirect_to change_password_path, notice: "Current password not verifed."
    end

  end
=end


  def login
    @user = User.new
  end

  def user_login
    @user = params[:email_id]
  end

  def mykutangaza
    @user = current_user
    @adverts = @user.adverts.where(:approved => true, :accept => true).paginate(page: params[:page], per_page: 5)
  end

  def onhold_ads
    @user = current_user
    @adverts = @user.adverts.where(:accept => false).paginate(page: params[:page], per_page: 5)
  end

  def pending_ads
    @user = current_user
    @adverts = @user.adverts.where(:approved => false, :accept => true).paginate(page: params[:page], per_page: 5)
  end

  def expired_ads
    @user = current_user
    @adverts = @user.adverts.where(:expire => true).paginate(page: params[:page], per_page: 5)
  end

  def promote_my_ads

  end

  def my_profile
    @user = current_user
  end

  def change_password
    @user = current_user
  end

  def my_order
    @user = current_user
    search = params[:date]
    if search.present?
      @adverts = @user.adverts.where("extract(month from adverts.created_at) =? AND extract(year from adverts.created_at) =?", search[:month], search[:year]).paginate(page: params[:page], per_page: 20)
    else
      @adverts = @user.adverts.paginate(page: params[:page], per_page: 20)
    end
  end

  def search_my_ads
    @user = current_user
    @adverts = @user.adverts.where("title ILIKE '%#{params[:search][:text1]}%' ").paginate(page: params[:page], per_page: 5)
  end

=begin
  def search_user
    @user = User.find_by_email(params[:search][:email])
    if @user.present?
      Usermail.password_link(@user).deliver
      redirect_to root_url, notice: "Reset password link send to your email."
    else
      redirect_to session[:current_url], notice: 'Email address not found. Please enter correct email address'
    end
  end
=end

end
