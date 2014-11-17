require "rails_helper"

describe Api::ProjectsController do
  let(:project) do
    create(:project)
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index, format: :json
      expect(response).to render_template :index
    end
    it "sets the cottect @projects variable" do
      get :index, format: :json
      expect(assigns :projects).to eq [project]
    end
    it "returns a JSON" do
      expect(response.body).to match ""
    end
  end
end
