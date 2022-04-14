# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

PROJECT_PATH = "/home/aric.zheng/backup"
set :output, "#{PROJECT_PATH}/.backup/log/schedule.log"

every 10.days, at: ["02:00 am"] do
  command "cd #{PROJECT_PATH} && npm run backup:52doc.com"
end

every 7.days, at: ["02:10 am"] do
  command "cd #{PROJECT_PATH} && npm run backup:fasimi.com"
end

every 7.days, at: ["02:40 am"] do
  command "cd #{PROJECT_PATH} && npm run backup:shebao.work"
end

every 7.days, at: ["03:00 am"] do
  command "cd #{PROJECT_PATH} && npm run backup:js.work"
end
