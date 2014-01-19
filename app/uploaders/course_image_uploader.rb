class CourseImageUploader < ApplicationUploader
  include ImageDefaults

  process resize_to_fit: [300, 300]

  version :thumb do
    #NOTE resize with fill background
    process resize_and_pad: [100, 80]
  end
end
