class Api::Companies::CoursesController < Api::Companies::ApplicationController
  def fire_event
    @course = resource_company.courses.find(params[:id])
    #FIXME authorize_action_for @course

    @course.send :"fire_#{params.fetch(:state_machine, :state)}_event", params[:event]
    respond_with @course, location: nil
  end
end
