class UsersController < ApplicationController
  #before_filter :user_remembered?
  #before_filter :current_location
  #before_filter :user_required, except: [:new, :create, :forgot_password, :search_user]
  #before_filter :ad_expire?
  #before_filter :store_location, except: [:new, :create, :show, :update, :search_user]


  def show
    @user = User.find(params[:id])
  end

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

  def search_user
    @user = User.find_by_email(params[:search][:email])
    if @user.present?
      Usermail.password_link(@user).deliver
      redirect_to root_url, notice: "Reset password link send to your email."
    else
      redirect_to session[:current_url], notice: 'Email address not found. Please enter correct email address'
    end
  end
end
