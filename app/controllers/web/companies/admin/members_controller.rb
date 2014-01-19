class Web::Companies::Admin::MembersController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_members

  def index
    query = {s: 'created_at desc'}.merge(params[:q] || {})
    @q = resource_company.course_members.ransack(query)
    @members = @q.result(distinct: true).page(params[:page]).per(200).decorate
  end

  def new
    @course_member = Company::Admin::CourseMemberType.new
  end

  def create
    @course_member = ::Company::Admin::CourseMemberType.new(params[:course_member])

    if @course_member.save
      f(:success)
      redirect_to action: 'index'
    else
      f(:error)
      render :new
    end
  end
end
