# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendant, class: "Course::Lesson::Attendant" do
    user
  end
end
