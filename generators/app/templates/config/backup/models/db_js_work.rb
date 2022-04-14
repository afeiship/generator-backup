# encoding: utf-8

##
# Backup Generated: db_shebao_work
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t db_shebao_work [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
Model.new(:db_js_work, "Bakcup for db_js_work") do
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  archive :my_archive do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.root "/home/aric.zheng/aric-jswork/jsw-rails/db"
    archive.add "production.sqlite3"
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path = ".backup/stores/"
    local.keep = 5
    # local.keep       = Time.now - 2592000 # Remove all backups older than 1 month.
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    # mail.on_success           = false
    mail.to = "88603982@qq.com"
  end

  after do |exit_status|
    Dir.chdir("/home/aric.zheng/aric-jswork/jsw-rails/db") do
      target_file = "production.sqlite3.tar.gz"
      month = Time.new.strftime("%Y-%m")
      system "rm -rf *.tar.gz && tar zcf #{target_file} production.sqlite3"
      system "bpuc -s #{target_file} -d '/Websites/js.work/db_backup/#{month}/db.tar.gz' -t -p db_"
    end
  end
end
