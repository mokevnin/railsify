class Web::Companies::Courses::MembersController < Web::Companies::Courses::ApplicationController
  before_action :authenticate_user!

  def create
    authorize_action_for Course::Member, course: resource_course
    member = resource_course.members.build
    member.user = current_user

    if member.save
      UserMailer.join_to_course(member).deliver
      f(:success)
    else
      f(:error)
    end
    redirect_to :back
  end

  def destroy
    member = resource_course.members.find_by!(user: current_user)
    if member.destroy
      f(:success)
    else
      f(:error)
    end
    redirect_to :back
  end
end
