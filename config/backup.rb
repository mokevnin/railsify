# encoding: utf-8

##
# Backup Generated: backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t local_backup [-c <path_to_configuration_file>]
#
Backup::Model.new(:backup, 'local coursify backup') do
  ##
  # Split [Splitter]
  #
  # Split the backup file in to chunks of 250 megabytes
  # if the backup file size exceeds 250 megabytes
  #
  # split_into_chunks_of 250

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    db.name               = "coursify_production"
    db.username           = "postgres"
    # db.password           = "my_password"
    # db.host               = "localhost"
    # db.port               = 5432
    # db.socket             = "/tmp/pg.sock"
    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ["-xc", "-E=utf8"]
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = "~/backups/"
    local.keep       = 5
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the Wiki for other delivery options.
  # https://github.com/meskyanichi/backup/wiki/Notifiers
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.delivery_method      = :exim
    mail.from                 = 'VPS 137651-20002'
    mail.to                   = 'mokevnin@gmail.com'

    # mail.from                 = "sender@email.com"
    # mail.to                   = "receiver@email.com"
    # mail.address              = "smtp.gmail.com"
    # mail.port                 = 587
    # mail.domain               = "your.host.name"
    # mail.user_name            = "sender@email.com"
    # mail.password             = "my_password"
    # mail.authentication       = "plain"
    # mail.encryption           = :starttls
  end
end
