class Api::Companies::PagesController < Api::Companies::ApplicationController
  before_filter do
    forbid(params[:controller]) unless current_user.can_manage?(resource_company)
  end

  def reorder
    params[:pages].each_with_index do |id, index|
      p = resource_company.pages.where(id: id).first
      p.update_attribute(:order, index + 1) if p
    end

    head :ok
  end

  def index
    pages = resource_company.pages.all
    respond_with pages, location: nil
  end

  def edit
    page = resource_company.pages.find(params[:page])
    respond_with page
  end
end
