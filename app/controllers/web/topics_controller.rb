class Web::TopicsController < Web::ApplicationController
  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true)
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    topic = AccountTopicType.new(params[:topic])
    topic.creator = current_user
    if topic.save
      f(:success)
      redirect_to topic_path(topic)
    else
      f(:error)
      render :new
    end
  end

  def update
    @topic = current_user.topics.find(params[:id])
    @topic = @topic.becomes(AccountTopicType)
    if @topic.update_attributes(params[:topic])
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    @topic = current_user.topics.find(params[:id])
    @topic.destroy

    redirect_to account_topics_path
  end
end
