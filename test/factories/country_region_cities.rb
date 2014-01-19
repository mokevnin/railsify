# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country_region_city, :class => 'Country::Region::City' do
    region nil
    name "MyString"
  end
end
