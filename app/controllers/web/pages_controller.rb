class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.find_by!(slug: params[:id])

    title @page
  end

  def tour

  end
end
