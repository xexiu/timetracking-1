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
end
