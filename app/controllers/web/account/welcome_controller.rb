class Web::Account::WelcomeController < Web::Account::ApplicationController
  def index
    @members = current_user.course_members.decorate
    @companies = current_user.companies_where_i_work
    @course_teachers = current_user.course_teachers.published

    lessons = current_user.learn_lessons.nearest.decorate
    @schedule = ActiveSupport::OrderedHash.new
    lessons.each do |l|
      @schedule[l.start.to_date] ||= []
      @schedule[l.start.to_date] << l
    end
  end
end
