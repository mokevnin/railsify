require 'test_helper'

class Web::TopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hub = create('category/hub')
    @user = create(:user)
    @topic = create(:topic, creator: @user)

    NewSessionPage.sign_in(@user)
  end

  test "#index" do
    TopicsPage.visit
  end

  test "#create" do
    t = build :topic

    p = NewTopicPage.visit
    p.create_topic(t)

    topic = Topic.where(name: t.name).first
    assert { topic }
    assert { topic.category_hubs.count == 1 }
  end

  test "#update" do
    attrs = attributes_for :topic
    p = EditTopicPage.visit(id: @topic.id)
    p.update_topic(attrs)

    @topic.reload
    assert { attrs[:name] == @topic.name }
  end

  test "#destroy" do
    p = UserTopicsPage.visit(user_id: @user.login)
    p.click_link('delete')

    assert { !Topic.exists?(@topic.id) }
  end
end
