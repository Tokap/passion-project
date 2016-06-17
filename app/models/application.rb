class Application < ActiveRecord::Base
	belongs_to :user
  # Remember to create a migration!

  def days_since_application
    days_passed = (Date.today - date_applied).to_i
    return days_passed
  end

  def application_status
    if self.days_since_application < 7
      return "#E8A60C" #ORANGE
    elsif self.days_since_application >= 7 && self.days_since_application <= 14
      return "#51A137" #GREEN
    elsif self.days_since_application > 14
      return "#0DFFC6" #BLUE
    elsif self.days_since_application > 35
      return "#2B0CE8" #DARK BLUE
    end
  end
end
