# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country_region, :class => 'Country::Region' do
    country nil
    name "MyString"
  end
end
