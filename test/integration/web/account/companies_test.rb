require 'test_helper'

class Web::Account::CompaniesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @attrs = attributes_for :company
    ::Sessions::NewPage.sign_in(@user)
  end

  test "#index of companies" do
    ::Account::Companies::IndexPage.visit
    assert_response :ok
  end

  test "#new #create company" do
    @attrs[:state_event] = :activate

    p = ::Account::Companies::NewPage.visit
    p.create(@attrs)

    company = @user.companies.find_by name: @attrs[:name]
    assert { company }
  end
end
