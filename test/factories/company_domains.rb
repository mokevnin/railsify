# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'company/domain' do
    sequence(:name) {|n| "www.my_domain#{n}.ru" }
  end
end
