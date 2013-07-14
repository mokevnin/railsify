require 'test_helper'

class Web::HubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_list('category/hub', 5)
  end

  test "#index" do
    HubsPage.visit
  end
end
