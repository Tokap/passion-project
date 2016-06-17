class Application < ActiveRecord::Base
	belongs_to :user
  # Remember to create a migration!

  def days_since_application
    days_passed = (Date.today - date_applied).to_i
    return days_passed
  end

  def application_status
    if self.days_since_application < 7
      return "#E8A60C" #ORANGE (TOO SOON. DO NOTHING.)
    elsif self.days_since_application >= 7 && self.days_since_application <= 14
      return "#51A137" #GREEN (ACTION SUGGESTED)
    elsif self.days_since_application > 35
      return "#C0C0C0" #GRAY (SUPER DEAD)
    elsif self.days_since_application > 14
      return "#0DFFC6" #TEAL BLUE (BASICALLY DEAD)

    end
  end
end
