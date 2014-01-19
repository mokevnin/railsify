class Web::Companies::PagesController < Web::Companies::ApplicationController
  def show
    @page = resource_company.pages.published.where(slug: params[:id]).first!

    title @page
  end
end
