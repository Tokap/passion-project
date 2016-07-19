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

every :sunday, :at => '7:00pm' do
	rake "email:send"
end

####### HOW ITLL WORK - Custom Method for emails ############
# every :sunday, :at => '7pm' do #
#   runner "User.send_email"
# end

# Class User < ActiveRecord::Base
	# def send_email
	# 	applications = self.applications
	# 	app_summary = ""
	# 	applications.each do |application|
	# 		app_summary << "<h1>#{application.company}</h1><p>#{application.position_title}</p><p>#{application.contact_name}</p>
	# 		<p><#{application.phone}/p><p><#{application.email}/p><p><#{application.notes}/p><br><br>"
	# 	end
	# 	Pony.mail(:to => 'allenpatrick86@gmail.com', :from => 'allenpatrick86@gmail.com', :subject => 'Your Recent Job Summary',
	# 		:body => "#{app_summary}"
	# end
# end