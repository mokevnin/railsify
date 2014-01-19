class Web::Companies::Admin::ReviewsController < Web::Companies::Admin::ApplicationController
  add_breadcrumb :index, :company_admin_reviews

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = resource_company.course_reviews.ransack(query)
    @reviews = @q.result(distinct: true)
  end

  def edit
    review = resource_company.course_reviews.find(params[:id])
    @review = review.becomes Company::CourseReviewType

    add_breadcrumb @review.id, edit_company_admin_review_path(@review)
  end

  def update
    review = resource_company.course_reviews.find(params[:id])

    @review = review.becomes Company::CourseReviewType
    if @review.update_attributes(params[:course_review])
      f(:success)
      redirect_to company_admin_reviews_path
    else
      f(:error)
      render :edit
    end
  end
end
