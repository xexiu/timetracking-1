class Project < ActiveRecord::Base
  has_many :entries

  def self.last_created_projects(number)
    order(created_at: :desc).limit(number)
  end

  def total_hours
    hours = 0
    minutes = 0
    entries.each do |entry|
      hours += entry.hours
      minutes += entry.minutes
    end
    hours + (minutes / 60)
  end

end
