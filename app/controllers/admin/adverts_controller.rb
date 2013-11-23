class Admin::AdvertsController < Admin::AdminController

  def index
    @adverts = Advert.all
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def new
    @advert = Advert.new
    @advert.photos.build
  end

  def edit
    @advert = Advert.find(params[:id])
    @photo = Photo.find_by_advert_id(@advert)
  end

  def create
    @advert = Advert.new(params[:advert])
    @advert.photos.build(:image => params[:image])
    if @advert.save
      redirect_to [:admin, @advert], notice: 'Advert was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @advert = Advert.find(params[:id])
    if @advert.update_attributes(params[:advert])
      redirect_to [:admin, @advert], notice: 'Advert was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy
    redirect_to admin_adverts_url
  end

end
