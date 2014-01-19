class LogoUploader < ApplicationUploader
  include ImageDefaults

  process resize_to_fit: [300, 300]

  version :thumb do
    process resize_to_fit: [100, 100]
  end
end
