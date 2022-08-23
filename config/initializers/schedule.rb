require 'rufus-scheduler'
require 'rake'

Rails.app_class.load_tasks
scheduler = Rufus::Scheduler::singleton
scheduler.in '1w' do
  begin
    Rake::Task['db:create_course'].invoke
    Rake::Task['db:create_course'].reenable
  rescue Exception => e
    Rails.logger.error 'ERROR in db:create_course'
    Rails.logger.error e.inspect
    Rails.logger.error e.backtrace
  end
end
