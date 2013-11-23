class Admin::SectionsController < Admin::AdminController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(params[:section])

    if @section.save
      redirect_to admin_sections_url, notice: 'Section was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      redirect_to admin_sections_url, notice: 'Section was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to admin_sections_url
  end

end
