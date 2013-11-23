class Admin::MakesController < Admin::AdminController

  def index
    @makes = Make.all
  end

  def show
    @make = Make.find(params[:id])
  end

  def new
    @make = Make.new
  end

  def edit
    @make = Make.find(params[:id])
  end

  def create
    @make = Make.new(params[:make])
      if @make.save
          redirect_to [:admin, @make], notice: 'Make was successfully created.'
      else
          render action: "new"
      end
  end

  def update
    @make = Make.find(params[:id])
      if @make.update_attributes(params[:make])
        redirect_to [:admin, @make], notice: 'Make was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    @make = Make.find(params[:id])
    @make.destroy
      redirect_to admin_makes_url
  end

end
