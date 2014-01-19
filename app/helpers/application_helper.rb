module ApplicationHelper
  include Concerns::CustomUrlHelpers
  include ModelHelper
  include BootstrapHelper

  mix :company do
    def company_collection
      Company.web
    end

    def company_teacher_by(user)
      resource_company.teachers.find_by user: user
    end
  end

  def default_search_form_options(options = {})
    {method: 'get', html: {class: 'form-inline'}, defaults: {label: false, required: false}}.merge(options)
  end

  def prepare_from(from = url_for(only_path: false))
    params[:from].presence || from
  end

  def markdown(text)
    #options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    options = {autolink: true, space_after_headers: true}
    html_options = {filter_html: true}
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(html_options), options)
    md.render(text)
  end

  def simple_form_for(record, options={}, &block)
    options[:builder] ||= BuilderWithTypeChecker
    super
  end

  def course_subscription_state(course)
    if course.course_finished?
      course.human_course_state_name
    elsif !signed_in?
      t('course.auth')
    elsif course.members.exists?(user: current_user)
      t('course.member')
    elsif course.subscription_denied?
      course.human_subscription_state_name
    elsif !course.has_seat?
      t('course.has_no_seat')
    elsif course.subscribable_by?(current_user)
      #TODO запилить: осталось 5 мест
      t('course.registration_open')
    end
  end
end
