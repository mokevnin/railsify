# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic_hub, :class => 'Topic::Hub' do
    topic nil
    hub nil
  end
end
