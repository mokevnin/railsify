class Web::CompaniesController < Web::ApplicationController
  authorize_actions_for Company

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = Company.web.ransack(query)
    @companies = @search.result(distinct: true).page(params[:page])

    title :companies
  end
end
