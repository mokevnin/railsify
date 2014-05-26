class Web::Companies::NewsController < Web::Companies::ApplicationController
  before_action do
    title :news
  end

  def index
    @news = resource_company.news.page(params[:page]).decorate
  end

  def show
    @news = resource_company.news.find_by!(slug: params[:id]).decorate

    add_breadcrumb @news, :company_news
    title @news
  end
end
