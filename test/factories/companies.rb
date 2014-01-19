# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :company do
    creator
    name
    login { generate :string }

    facebook_group_link { generate :url }
    public_email { generate :email }
    phone
    description

    after(:create) do |c|
      u = c.creator

      teacher = create('company/teacher', user: u, company: c)
      create('company/news', company: c, creator: u)
      create('company/page', company: c, creator: u)
      create(:offline_course, company: c, company_teachers: [teacher], creator: u)
      create(:online_course, company: c, company_teachers: [teacher], creator: u)

      offline_course = create(:offline_course, company: c, creator: u)
      offline_course.finish_course

      c.activate
    end
  end
end
