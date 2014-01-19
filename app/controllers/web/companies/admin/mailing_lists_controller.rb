class Web::Companies::Admin::MailingListsController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_mailing_lists

  before_action do
    forbid(params[:controller]) unless current_user.can_update?(resource_company)
  end

  def index
    @mailing_lists = resource_company.mailing_lists
  end

  def new
    @mailing_list = Company::Admin::MailingListEditType.new

    add_breadcrumb :new, new_company_admin_mailing_list_path
  end

  def create
    @mailing_list = Company::Admin::MailingListEditType.new(params[:mailing_list])
    @mailing_list.creator = current_user

    if @mailing_list.save
      f(:success)
      redirect_to edit_company_admin_mailing_list_path(@mailing_list)
    else
      f(:error)
      render :new
    end
  end

  def edit
    @mailing_list = resource_company.mailing_lists.find(params[:id])

    add_breadcrumb @mailing_list, company_admin_mailing_list_path(@mailing_list)
  end

  def update
    mailing_list = resource_company.mailing_lists.find(params[:id])
    @mailing_list = mailing_list.becomes Company::Admin::MailingListEditType

    if @mailing_list.update(params[:mailing_list])
      f(:success)
      redirect_to edit_company_admin_mailing_list_path(@mailing_list)
    else
      f(:error)
      render :edit
    end
  end
end
