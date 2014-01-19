# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'company/manager' do
    company
    user
  end
end
