class Web::Account::CoursesController < Web::Account::ApplicationController
  add_breadcrumb :index, :account_courses

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = current_user.course_members.ransack(query)
    @members = @search.result.page(params[:page]).decorate
  end
end
