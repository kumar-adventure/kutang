class Admin::SubcategoriesController < Admin::AdminController

  def index
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
    @category = Category.find(@subcategory.category_id)
  end

  def create
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.new(params[:subcategory])
      if @subcategory.save
         redirect_to [:admin, @subcategory], notice: 'Subcategory was successfully created.'
      else
         render action: [:admin, :new]
      end
  end

  def update
    @subcategory = Subcategory.find(params[:id])

      if @subcategory.update_attributes(params[:subcategory])
        redirect_to [:admin, @subcategory], notice: 'Subcategory was successfully updated.'
      else
        render action: [:admin, :edit]
      end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy
      redirect_to admin_subcategories_url
  end
end
