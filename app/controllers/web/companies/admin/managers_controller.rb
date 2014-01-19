class Web::Companies::Admin::ManagersController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_managers

  before_action do
    forbid(params[:controller]) unless current_user.can_update?(resource_company)
  end

  before_action only: [:new, :create] do
    add_breadcrumb :new, :new_company_admin_manager
  end

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = resource_company.managers.ransack(query)
    @managers = @search.result(distinct: true).page(params[:page]).decorate
  end

  def new
    #TODO впилить autocomplete
    @company_manager = resource_company.managers.build
  end

  def create
    @company_manager = ::Company::Admin::CompanyManagerEditType.new(params[:company_manager])
    @company_manager.company = resource_company

    if @company_manager.save
      f(:success)
      redirect_to action: 'index'
    else
      f(:error)
      render :new
    end
  end

  def destroy
    company_manager = resource_company.managers.find(params[:id])
    company_manager.destroy

    redirect_to action: "index"
  end
end
