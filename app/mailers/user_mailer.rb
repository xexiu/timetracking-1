class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def entry_created(project)
    @project = project
    mail(to: 'xexiu.sj@gmail.com', subject: "New entry created in project #{project.name}")
  end

end
