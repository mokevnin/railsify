class Web::Companies::PagesController < Web::Companies::ApplicationController
  def show
    @page = resource_company.pages.published.find_by!(slug: params[:id])

    title @page
  end
end
