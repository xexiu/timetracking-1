require 'rails_helper'

describe 'Project' do
  let(:project) do
    create(:project)
  end

  describe "validations" do
    it 'is valid' do
      expect(project).to be_valid
    end
    it 'it is not valid without a name' do
      project.name = nil
      expect(project).not_to be_valid
    end
    context 'when the name is longer than 30 chars' do
      it 'is not valid' do
        project.name = "a" * 31
        expect(project).not_to be_valid
      end
    end
    context 'when the name is allready taken' do
      it 'is not valid' do
        Project.create(name: 'Project1')
        project.name = 'Project1'
        expect(project).not_to be_valid
      end
    end
    context 'when the name has special char' do
      it 'is not valid' do
        project.name = "´"
        expect(project).not_to be_valid
      end
    end
  end

  describe 'method' do
    describe "total_hours" do
      it "returns the amount of total hours" do
        Entry.create(hours: 1, minutes: 40, date: Date.today, project_id: project.id)
        Entry.create(hours: 1, minutes: 40, date: Date.today, project_id: project.id)
        expect(project.total_hours).to eq 3
      end
    end
    context 'when the project has no entries' do
      it 'return 0' do
        expect(project.total_hours).to eq 0
      end
    end
    describe 'self.last_created_projects' do
     context 'when there are some projects' do
       it 'returns the n last created projects' do
         expect(Project.last_created_projects(1)).to eq [project]
       end
     end
     context 'when there are no projects' do
       it 'returns an empty array' do
         expect(Project.last_created_projects(2)).to eq []
       end
     end
   end
  end
end
