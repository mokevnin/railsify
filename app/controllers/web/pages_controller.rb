class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.where(slug: params[:id]).first!

    title @page
  end

  def tour

  end
end
