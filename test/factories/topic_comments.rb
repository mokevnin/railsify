# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'topic/comment' do
    creator
    topic
    body { generate :string }
  end
end
