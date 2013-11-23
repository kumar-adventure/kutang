class ContactsController < ApplicationController
  before_filter :user_remembered?

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if simple_captcha_valid?
      if @contact.save
        redirect_to @contact
      else
        render action: "new"
      end
    else
       redirect_to new_contact_path
    end
  end

end
