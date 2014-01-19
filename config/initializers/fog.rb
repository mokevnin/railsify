CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAILEY6I7XNZZJQWLQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    #:region                 => 'eu-west-1'                  # optional, defaults to 'us-east-1'
    #:host                   => 's3.example.com',             # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'edu73'
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
