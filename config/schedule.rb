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

every :day, :at => '3:20pm' do
	# File.open(test, 'w') { |file| file.write("your text") }
	rake "email:send"
end

# (1..24).each do |hour|
# 	(0..59).each do |minute|
# 		every :day, :at => "#{hour}:#{minute}" do
# 			# File.open(test, 'w') { |file| file.write("your text") }
# 			command "ruby /Users/tokap/Passion-project/passion-project/test.rb"
# 		end
# 	end
# end
