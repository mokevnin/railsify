class Web::Companies::Admin::OnlineCoursesController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_courses

  def new
    @course = Company::Admin::OnlineCourseEditType.new
    if resource_company.teacher_users.include? current_user
      @course.company_teachers << resource_company.teachers.find_by(user: current_user)
    end

    add_breadcrumb :new, new_company_admin_online_course_path
  end

  def create
    @course = Company::Admin::OnlineCourseEditType.new(params[:online_course])
    @course.creator = current_user
    @course.company = resource_company

    if @course.save
      f(:success)
      redirect_to edit_company_admin_online_course_path(@course)
    else
      f(:error)
      render :new
    end
  end

  def edit
    @course = resource_company.courses.find(params[:id])
    authorize_action_for @course
    add_breadcrumb @course, edit_company_admin_online_course_path(@course)
  end

  def update
    course = resource_company.courses.find(params[:id])
    @course = course.becomes Company::Admin::OnlineCourseEditType
    authorize_action_for @course

    if @course.update(params[:online_course])
      f(:success)
      redirect_to edit_company_admin_online_course_path(@course)
    else
      f(:error)
      render :edit
    end
  end
end
