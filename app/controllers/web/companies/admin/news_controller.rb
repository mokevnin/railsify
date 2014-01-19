class Web::Companies::Admin::NewsController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_news_index

  before_action do
    forbid(params[:controller]) unless current_user.can_update?(resource_company)
  end

  def index
    @q = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = resource_company.news.ransack(@q)
    @news = @search.result(distinct: true).page(params[:page])
  end

  def new
    @news = Company::Admin::NewsEditType.new

    add_breadcrumb :new, :new_company_admin_news
  end

  def create
    @news = Company::Admin::NewsEditType.new(params[:company_news])
    @news.creator = current_user
    @news.company = resource_company

    if @news.save
      f(:success)
      redirect_to edit_company_admin_news_path(@news)
    else
      f(:error)
      render :new
    end
  end

  def edit
    @news = resource_company.news.find(params[:id])

    add_breadcrumb @news, edit_company_admin_news_path(@news)
  end

  def update
    news = resource_company.news.find(params[:id])
    @news = news.becomes Company::Admin::NewsEditType

    if @news.update(params[:company_news])
      f(:success)
      redirect_to edit_company_admin_news_path(@news)
    else
      f(:error)
      render :edit
    end
  end
end
