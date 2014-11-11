class Project < ActiveRecord::Base
  has_many :entries

  def self.last_created_projects(number)
    order(created_at: :desc).limit(number)
  end

end
