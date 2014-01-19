class OfflineCourseDecorator < CourseDecorator
  def location
    address.to_s.presence || h.t('location.unknow')
  end
end
