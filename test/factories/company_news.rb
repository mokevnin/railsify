# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'company/news' do
    company
    creator
    name
    body
    slug
  end
end
