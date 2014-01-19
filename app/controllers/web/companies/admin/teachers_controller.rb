class Web::Companies::Admin::TeachersController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_teachers

  before_action do
    forbid(params[:controller]) unless current_user.can_update?(resource_company)
  end

  before_action only: [:new, :create] do
    add_breadcrumb :new, :new_company_admin_teacher
  end

  def index
    query = { 's' => 'created_at desc', 'state_eq' => :confirmed }.merge(params[:q] || {})
    @q = resource_company.teachers.ransack(query)
    @teachers = @q.result(distinct: true).page(params[:page]).decorate
  end

  # def new
  #   @company_teacher = resource_company.teachers.build
  # end

  # def create
  #   @company_teacher = ::Company::Admin::CompanyTeacherEditType.new(params[:company_teacher])
  #   @company_teacher.company = resource_company

  #   if @company_teacher.save
  #     f(:success)
  #     redirect_to action: 'index'
  #   else
  #     f(:error)
  #     render :new
  #   end
  # end

  def edit
    @company_teacher = resource_company.teachers.find(params[:id])

    add_breadcrumb @company_teacher, company_admin_teacher_path(@company_teacher)
  end

  def update
    company_teacher = resource_company.teachers.find(params[:id])
    @company_teacher = company_teacher.becomes ::Company::Admin::CompanyTeacherEditType

    if @company_teacher.update(params[:company_teacher])
      f(:success)
      redirect_to action: 'index'
    else
      f(:error)
      render :new
    end
  end
end
