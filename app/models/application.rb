class Application < ActiveRecord::Base
	belongs_to :user
  # Remember to create a migration!

  def days_since_application
    days_passed = (Date.today - date_applied).to_i
    return "New" if days_passed < 7
    return "Hot" if days_passed >= 7 && days_passed <= 14
    return "Frozen" if days_passed > 35
    return "Cold" if days_passed > 14
  end
end
