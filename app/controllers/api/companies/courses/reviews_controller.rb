class Api::Companies::Courses::ReviewsController < Api::Companies::Courses::ApplicationController
  before_filter do
    forbid(params[:controller]) unless current_user.can_manage?(resource_company)
  end

  def fire_event
    @review = resource_course.reviews.find(params[:id])
    #FIXME authorize_action_for @review

    @review.send :"fire_#{params.fetch(:state_machine, :state)}_event", params[:event]
    respond_with @review, location: nil
  end
end
