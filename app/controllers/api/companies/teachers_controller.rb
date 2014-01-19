class Api::Companies::TeachersController < Api::Companies::ApplicationController
  def create
    @teacher = resource_company.teachers.build user: current_user
    if @teacher.save
      f(:success)
    end

    respond_with @teacher, location: nil
  end

  def fire_event
    @teacher = resource_company.teachers.find(params[:id])
    #FIXME authorize_action_for @teacher

    @teacher.send :"fire_#{params.fetch(:state_machine, :state)}_event", params[:event]
    respond_with @teacher, location: nil
  end
end
