class Application < ActiveRecord::Base
	belongs_to :user
  # Remember to create a migration!

  def days_since_creation
    time_passed = Date.today - date_applied
    return time_passed
  end
end
