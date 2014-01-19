require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "creator become manager" do
    @company = create :company
    assert { @company.manager_users.include? @company.creator }
  end

  test "login validation" do
    company = build :company, login: "www"
    assert { !company.valid? }
    company = build :company, login: "domain_"
    assert { !company.valid? }
    company = build :company, login: "login"
    assert { company.valid? }
  end
end
