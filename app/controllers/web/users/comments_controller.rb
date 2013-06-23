class Web::Users::CommentsController < Web::Users::ApplicationController
  def index
    @comments = resource_user.topic_comments.page(params[:page])
  end
end
