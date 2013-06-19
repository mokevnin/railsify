require 'test_helper'

class Web::Account::TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = create :topic
    @user = @topic.creator
    @params = {id: @topic.id}

    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :topic

    post :create, topic: attrs
    assert_response :redirect

    topic = Topic.find_by_name(attrs[:name])
    assert topic
  end

  test "should get update" do
    attrs = attributes_for :topic

    patch :update, @params.merge(topic: attrs)
    assert_response :redirect

    @topic.reload

    assert_equal attrs[:name], @topic.name
  end

  test "should get destroy" do
    delete :destroy, @params
    assert_response :redirect
  end

end
