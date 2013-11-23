class Admin::UnapprovedAdvertsController < Admin::AdminController
  def index
    @adverts = Advert.unapproved
    render "admin/adverts/index"
  end

end
