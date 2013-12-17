class AdvertsController < ApplicationController
  before_filter :user_required, only: [:edit, :update, :destroy]
  before_filter :ad_expire?
  before_filter :current_location
  before_filter :user_remembered?


  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
    @advert.add_visitor if @advert.user_id != session[:user_id]
  end

  def new
    make = Make.find_by_title params[:make]  if params[:make].present?
    @models = ["--------"] + make.models.pluck(:title) if make.present?
    @value = params[:value] if params[:value].present?
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
    else
      @subcategory = Subcategory.find(params[:subcategory_id])
      @category = Category.find(@subcategory.category_id)
      session[:sub_id] = @subcategory.id
    end
    @makes = @category.makes.pluck(:title)
    @advert = Advert.new
    @advert.promotes.build
    @advert.photos.build
  end

  def edit
    @advert = Advert.find(params[:id])
    @category = Category.find(@advert.category_id)
  end

  def create
    @sub_category = Subcategory.where(name: params[:sub_category]).first
    if @sub_category.blank?
      flash[:error] = "Given category does not exists."
      redirect_to root_url 
    end
    advert = @sub_category.adverts.new(params[:advert])
    if advert.save
      flash[:notice] = "Advertisement has successfully posted."
    else
      flash[:error] = "Advertisement did not post successfully."
    end
    redirect_to category_path(@sub_category.name)
=begin
    @makes = @category.makes.pluck(:title)
    @advert
    if validate_form_fields(@advert, params[:advert]).present?
      render 'adverts/new'
    else
      @advert.user_id = session[:user_id] if session[:user_id].present?
      @advert.subcategory_id = session[:sub_id] if session[:sub_id].present?
        if @advert.save
            session[:sub_id] = nil
            redirect_to category_advert_path(@category, @advert), notice: 'Advert was successfully created.'
        else
           render action: "new"
        end
    end
=end  

  end

  def update
    @advert = Advert.find(params[:id])
      if @advert.update_attributes(params[:advert])
         redirect_to session[:current_url], notice: 'Ad successfully updated.'
      else
         render action: "edit"
      end
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy
       redirect_to session[:current_url]
  end


  def repost
    @adverts = params[:advert_id]
    @adverts.each_with_index do |x, y|
      advert = Advert.find x
      advert.price = params[:price][y] if advert.pricing_strategy == "Price"
      advert.save
    end
    redirect_to session[:current_url]
  end

  def delete_adverts
    @adverts = params[:advert_id]
    @adverts.each do |x|
            advert = Advert.find x
            advert.destroy
    end
    redirect_to session[:current_url], notice: "Ad(s) deleted successfully."
  end

  def order_reference
    @advert = Advert.find(params[:id])
  end

  def poster_othersads
    @user = User.find(params[:user_id])
    @adverts = @user.adverts.approved.paginate(page: params[:page], per_page: 50)
  end

  def email_to_poster
    if simple_captcha_valid?
      mail = params[:email]
      advert = Advert.find(mail[:id])
      if advert
        Usermail.send_email(advert.email, mail[:sender_email], mail[:sender_name], mail[:sender_phone], mail[:message]).deliver
        redirect_to advert, notice: "Message sent successfully."
      else
        redirect_to advert, notice: "Message not sent."
      end
    else
      redirect_to advert, notice: "Secret Code did not match with the Image."
    end
  end


  def larger_image
    @advert = Advert.find(params[:advert])
  end



end
