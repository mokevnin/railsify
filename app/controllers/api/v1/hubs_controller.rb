class Api::V1::HubsController < Api::ApplicationController
  #
  # hubs list
  #
  #
  def index
    hubs = Category::Hub.page(params[:page])
    respond_with(hubs)
  end
end
