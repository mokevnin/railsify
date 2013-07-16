class Web::TopicsController < Web::ApplicationController
  def index
    @q = Topic.published.ransack(params[:q])
    @topics = @q.result(distinct: true)
  end

  def show

  end

  def new
    @topic = current_user.topics.build
  end

  def create
    topic = TopicType.new(params[:topic])
    topic.creator = current_user
    if topic.save
      f(:success)
      redirect_to topic_path(topic)
    else
      f(:error)
      render :new
    end
  end

  def edit
    @topic = current_user.topics.find(params[:id])
  end

  def update
    @topic = current_user.topics.find(params[:id])
    @topic = @topic.becomes(TopicType)
    if @topic.update_attributes(params[:topic])
      f(:success)
      redirect_to edit_topic_path(@topic)
    else
      f(:error)
      render :new
    end
  end

  def destroy
    @topic = current_user.topics.find(params[:id])
    @topic.destroy

    redirect_to user_topics_path(current_user.login)
  end
end
