require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    visit root_path
    assert page.has_content?('Habrahabr')
  end
end
