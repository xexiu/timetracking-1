# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

12.times do |index|
  Project.create name: "Project #{index + 1}", description: "Description for project #{index + 1}"
end

project = Project.create name: "Project 13"

Entry.create hours: 0, minutes: 45, project_id: project.id
Entry.create hours: 3, minutes: 32, project_id: project.id
