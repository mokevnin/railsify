class Web::Companies::Admin::ProfilesController < Web::Companies::Admin::ApplicationController
  def edit
    add_breadcrumb :edit, :company_admin_profile
  end

  def update
    @company = resource_company.becomes ::Account::CompanyEditType
    if @company.update(params[:company])
      f(:success)
      redirect_to action: :edit
    else
      f(:error)
      render :edit
    end
  end
end
