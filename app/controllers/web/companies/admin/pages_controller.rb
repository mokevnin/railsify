class Web::Companies::Admin::PagesController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_pages

  before_action do
    forbid(params[:controller]) unless current_user.can_update?(resource_company)
  end

  def index
    @pages = resource_company.pages
  end

  def new
    @page = Company::Admin::PageEditType.new
  end

  def create
    @page = Company::Admin::PageEditType.new(params[:company_page])
    @page.creator = current_user
    @page.company = resource_company

    if @page.save
      f(:success)
      redirect_to edit_company_admin_page_path(@page)
    else
      f(:error)
      render :new
    end
  end

  def edit
    @page = resource_company.pages.find(params[:id])

    add_breadcrumb @page, company_admin_page_path(@page)
  end

  def update
    page = resource_company.pages.find(params[:id])
    @page = page.becomes Company::Admin::PageEditType

    if @page.update(params[:company_page])
      f(:success)
      redirect_to edit_company_admin_page_path(@page)
    else
      f(:error)
      render :edit
    end
  end
end
