class Api::V1::HubsController < Api::ApplicationController
  def index
    hubs = Hub.page(params[:page])
    respond_with(hubs)
  end
end
