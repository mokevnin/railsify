class Web::Users::TopicsController < Web::Users::ApplicationController
  def index
    @topics = resource_user.topics.page(params[:page])
  end
end
