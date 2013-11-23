class Admin::ModelsController < Admin::AdminController

  def index
    @models = Model.all
  end

  def show
    @model = Model.find(params[:id])
  end

  def new
    @model = Model.new
  end

  def edit
    @model = Model.find(params[:id])
  end

  def create
    @model = Model.new(params[:model])
      if @model.save
        redirect_to [:admin, @model], notice: 'Model was successfully created.'
      else
        render action: "new"
      end
  end


  def update
    @model = Model.find(params[:id])
      if @model.update_attributes(params[:model])
        redirect_to [:admin, @model], notice: 'Model was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
      redirect_to admin_models_url
  end

end
