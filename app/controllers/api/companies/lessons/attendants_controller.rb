class Api::Companies::Lessons::AttendantsController < Api::Companies::Lessons::ApplicationController
  respond_to :csv

  before_filter do
    forbid(params[:controller]) unless current_user.can_manage?(resource_company)
  end

  #NOTE generate csv @see view file
  def index
    @members = resource_lesson.course.members.decorate
    #TODO генерировать вменяемое имя файла
    respond_with @members, location: nil
  end

  def create
    @attendant = resource_lesson.attendants.build(member_id: params[:member_id])
    @attendant.save

    respond_with @attendant, location: nil
  end

  def remove
    @attendant = resource_lesson.attendants.find_by(member_id: params[:member_id])
    @attendant.try :destroy

    respond_with @attendant, location: nil
  end
end
