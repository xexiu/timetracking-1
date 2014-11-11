class Project < ActiveRecord::Base
  has_many :entries

    extend FriendlyId
    friendly_id :name, use: :slugged

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
    # Project.first.entries.map |entry| {
    # entry.hours + entry.minutes / 60
    # }.sum.to_i
  end

end
