class Project < ActiveRecord::Base
  belongs_to :group
  has_many :entries
  validates :name, presence: true, uniqueness: true,length: { maximum: 30 }, format: {with: /\A[\w\s*]+\z/}
  # must have: name, description, be present, unique (title)
  # can't be: 'ironhack', 'ironhack' ==> false

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
