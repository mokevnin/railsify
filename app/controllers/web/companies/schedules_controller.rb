class Web::Companies::SchedulesController < Web::Companies::ApplicationController
  def show
    lessons = resource_company.course_lessons.nearest.decorate
    @schedule = ActiveSupport::OrderedHash.new
    lessons.each do |l|
      @schedule[l.start.to_date] ||= []
      @schedule[l.start.to_date] << l
    end

    title :schedule
  end
end
