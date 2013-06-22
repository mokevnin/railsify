class Web::Users::TopicsController < Web::Users::ApplicationController
  def index
    @topic = resource_user.topics.page(params[:page])
  end
end
