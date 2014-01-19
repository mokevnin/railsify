class AvatarUploader < ApplicationUploader
  include ImageDefaults

  process :resize_to_fit => [300, 300]

  version :medium do
    process :resize_to_fill => [150, 150]
  end

  version :thumb do
    process :resize_to_fill => [100, 100]
  end
end
