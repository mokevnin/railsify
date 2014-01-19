# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'company/page' do
    company
    creator
    name
    body
    slug

    after(:build) do |p|
      p.publish
    end
  end
end
