FactoryGirl.define do
  factory 'company_awaiting_teacher', class: Company::Teacher do
    company
    user
  end

  factory 'company/teacher', parent: 'company_awaiting_teacher' do
    after(:create) do |t|
      t.confirm
    end
  end
end
