class Web::Account::TopicsController < Web::Account::ApplicationController
  def index
    @topics = current_user.topics.page(params[:page])
  end

  def show
    @topic = current_user.topics.find(params[:id])
  end

  def new
    @topic = current_user.topics.build
  end

  def edit
    @topic = current_user.topics.find(params[:id])
  end

  def create
    @topic = AccountTopicType.new(params[:topic])
    @topic.creator = current_user
    if @topic.save
      redirect_to action: :index
    else
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
