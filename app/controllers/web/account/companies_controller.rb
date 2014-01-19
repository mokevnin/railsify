class Web::Account::CompaniesController < Web::Account::ApplicationController

  add_breadcrumb :index, :account_companies_path

  before_action only: [:new, :create] do
    add_breadcrumb :new, :new_account_company
  end

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = current_user.manage_in.ransack(query)
    @companies = @q.result.page(params[:page])
  end

  def new
    @company = ::Account::CompanyEditType.new
  end

  def create
    @company = ::Account::CompanyEditType.new(params[:company])
    @company.creator = current_user
    if @company.save
      f(:success)
      redirect_to account_companies_path
    else
      f(:error)
      render :new
    end
  end
end
