class Web::HubsController < Web::ApplicationController
  def index
    @q = Category::Hub.ransack(params[:q])
    @hubs = @q.result(distinct: true)
  end
end
