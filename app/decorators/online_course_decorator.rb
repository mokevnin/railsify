class OnlineCourseDecorator < CourseDecorator
  def location
    object.class.model_name.human
  end
end
